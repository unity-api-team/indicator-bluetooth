/*
 * Copyright 2013 Canonical Ltd.
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; version 3.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 *
 * Authors:
 *   Charles Kerr <charles.kerr@canonical.com>
 */

/**
 * Monitors whether or not bluetooth is blocked,
 * either by software (e.g., a session configuration setting)
 * or by hardware (e.g., user disabled it via a physical switch on her laptop).
 *
 * The Bluetooth class uses this as a backend for its 'blocked' property.
 * Other code can't even see this, so use Bluetooth.blocked instead. :)
 */
public class KillSwitch: Object
{
  public bool blocked { get; protected set; default = false; }

  public virtual void try_set_blocked (bool blocked) {}
}

/**
 * On Linux systems, monitors /dev/rfkill to watch for bluetooth blockage
 */
public class RfKillSwitch: KillSwitch
{
  public override void try_set_blocked (bool blocked)
  {
    return_if_fail (this.blocked != blocked);

    // write a 'soft kill' event to fkill
    var event = Linux.RfKillEvent() {
      op    = Linux.RfKillOp.CHANGE_ALL,
      type  = Linux.RfKillType.BLUETOOTH,
      soft  = (uint8)blocked
    };

    var bwritten = Posix.write (fd, &event, sizeof(Linux.RfKillEvent));
    if (bwritten == -1)
      warning ("Could not write rfkill event: %s", strerror(errno));
  }

  private class Entry
  {
    public uint32 idx;
    public Linux.RfKillType type;
    public bool soft;
    public bool hard;
  }

  private HashTable<uint32,Entry> entries;
  private int fd;
  private IOChannel channel;
  private uint watch;

  private bool calculate_blocked ()
  {
    foreach (Entry entry in entries.get_values())
      if (entry.soft || entry.hard)
        return true;

    return false;
  }

  ~RfKillSwitch ()
  {
    Source.remove (watch);
    Posix.close (fd);
  }

  public RfKillSwitch ()
  {
    entries = new HashTable<uint32,Entry>(direct_hash, direct_equal);

    var path = "/dev/rfkill";
    fd = Posix.open (path, Posix.O_RDWR | Posix.O_NONBLOCK );
    message ("fd is %d", fd);
    if (fd == -1)
      {
        warning (@"Can't open $path: $(strerror(errno)); KillSwitch disable");
      }
    else
      {
        // read everything that's already there, then watch for more
        while (read_event());
        channel = new IOChannel.unix_new (fd);
        watch = channel.add_watch (IOCondition.IN, on_channel_event);
      }
  }

  private bool on_channel_event (IOChannel source, IOCondition condition)
  {
    read_event ();
    return true;
  }

  private bool read_event ()
  {
    assert (fd != -1);

    var event = Linux.RfKillEvent();
    var n = sizeof (Linux.RfKillEvent);
    var bytesread = Posix.read (fd, &event, n);
   
    if (bytesread == n)
      {
        process_event (event);
        return true;
      }

    return false;
  }

  private void process_event (Linux.RfKillEvent event)
  {
    // we only want things that affect bluetooth
    if ((event.type != Linux.RfKillType.ALL) &&
        (event.type != Linux.RfKillType.BLUETOOTH))
      return;

    switch (event.op)
      {
        case Linux.RfKillOp.CHANGE:
        case Linux.RfKillOp.ADD:
          Entry entry = new Entry ();
          entry.idx = event.idx;
          entry.type = event.type;
          entry.soft = event.soft != 0;
          entry.hard = event.hard != 0;
          entries.insert (entry.idx, entry);
          break;

        case Linux.RfKillOp.DEL:
          entries.remove (event.idx);
          break;
      }

    // update the 'blocked' property
    blocked = calculate_blocked ();
  }
}
