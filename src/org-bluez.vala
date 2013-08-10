/* Generated by vala-dbus-binding-tool 0.4.0. Do not modify! */
/* Generated with: vala-dbus-binding-tool --gdbus --directory=. */
using GLib;

namespace org {

	namespace bluez {

		[DBus (name = "org.bluez.Manager", timeout = 120000)]
		public interface Manager : GLib.Object {

			[DBus (name = "GetProperties")]
			public abstract GLib.HashTable<string, GLib.Variant> get_properties() throws DBusError, IOError;

			[DBus (name = "DefaultAdapter")]
			public abstract GLib.ObjectPath default_adapter() throws DBusError, IOError;

			[DBus (name = "FindAdapter")]
			public abstract GLib.ObjectPath find_adapter(string pattern) throws DBusError, IOError;

			[DBus (name = "ListAdapters")]
			public abstract GLib.ObjectPath[] list_adapters() throws DBusError, IOError;

			[DBus (name = "PropertyChanged")]
			public signal void property_changed(string name, GLib.Variant value);

			[DBus (name = "AdapterAdded")]
			public signal void adapter_added(GLib.ObjectPath adapter);

			[DBus (name = "AdapterRemoved")]
			public signal void adapter_removed(GLib.ObjectPath adapter);

			[DBus (name = "DefaultAdapterChanged")]
			public signal void default_adapter_changed(GLib.ObjectPath adapter);
		}

		[DBus (name = "org.bluez.Manager", timeout = 120000)]
		public interface ManagerSync : GLib.Object {

			[DBus (name = "GetProperties")]
			public abstract GLib.HashTable<string, GLib.Variant> get_properties() throws DBusError, IOError;

			[DBus (name = "DefaultAdapter")]
			public abstract GLib.ObjectPath default_adapter() throws DBusError, IOError;

			[DBus (name = "FindAdapter")]
			public abstract GLib.ObjectPath find_adapter(string pattern) throws DBusError, IOError;

			[DBus (name = "ListAdapters")]
			public abstract GLib.ObjectPath[] list_adapters() throws DBusError, IOError;

			[DBus (name = "PropertyChanged")]
			public signal void property_changed(string name, GLib.Variant value);

			[DBus (name = "AdapterAdded")]
			public signal void adapter_added(GLib.ObjectPath adapter);

			[DBus (name = "AdapterRemoved")]
			public signal void adapter_removed(GLib.ObjectPath adapter);

			[DBus (name = "DefaultAdapterChanged")]
			public signal void default_adapter_changed(GLib.ObjectPath adapter);
		}

		[DBus (name = "org.bluez.Adapter", timeout = 120000)]
		public interface Adapter : GLib.Object {

			[DBus (name = "GetProperties")]
			public abstract GLib.HashTable<string, GLib.Variant> get_properties() throws DBusError, IOError;

			[DBus (name = "SetProperty")]
			public abstract void set_property(string name, GLib.Variant value) throws DBusError, IOError;

			[DBus (name = "RequestSession")]
			public abstract void request_session() throws DBusError, IOError;

			[DBus (name = "ReleaseSession")]
			public abstract void release_session() throws DBusError, IOError;

			[DBus (name = "StartDiscovery")]
			public abstract void start_discovery() throws DBusError, IOError;

			[DBus (name = "StopDiscovery")]
			public abstract void stop_discovery() throws DBusError, IOError;

			[DBus (name = "ListDevices")]
			public abstract GLib.ObjectPath[] list_devices() throws DBusError, IOError;

			[DBus (name = "CreateDevice")]
			public abstract GLib.ObjectPath create_device(string address) throws DBusError, IOError;

			[DBus (name = "CreatePairedDevice")]
			public abstract GLib.ObjectPath create_paired_device(string address, GLib.ObjectPath agent, string capability) throws DBusError, IOError;

			[DBus (name = "CancelDeviceCreation")]
			public abstract void cancel_device_creation(string address) throws DBusError, IOError;

			[DBus (name = "RemoveDevice")]
			public abstract void remove_device(GLib.ObjectPath device) throws DBusError, IOError;

			[DBus (name = "FindDevice")]
			public abstract GLib.ObjectPath find_device(string address) throws DBusError, IOError;

			[DBus (name = "RegisterAgent")]
			public abstract void register_agent(GLib.ObjectPath agent, string capability) throws DBusError, IOError;

			[DBus (name = "UnregisterAgent")]
			public abstract void unregister_agent(GLib.ObjectPath agent) throws DBusError, IOError;

			[DBus (name = "PropertyChanged")]
			public signal void property_changed(string name, GLib.Variant value);

			[DBus (name = "DeviceCreated")]
			public signal void device_created(GLib.ObjectPath device);

			[DBus (name = "DeviceRemoved")]
			public signal void device_removed(GLib.ObjectPath device);

			[DBus (name = "DeviceFound")]
			public signal void device_found(string address, GLib.HashTable<string, GLib.Variant> values);

			[DBus (name = "DeviceDisappeared")]
			public signal void device_disappeared(string address);
		}

		[DBus (name = "org.bluez.Adapter", timeout = 120000)]
		public interface AdapterSync : GLib.Object {

			[DBus (name = "GetProperties")]
			public abstract GLib.HashTable<string, GLib.Variant> get_properties() throws DBusError, IOError;

			[DBus (name = "SetProperty")]
			public abstract void set_property(string name, GLib.Variant value) throws DBusError, IOError;

			[DBus (name = "RequestSession")]
			public abstract void request_session() throws DBusError, IOError;

			[DBus (name = "ReleaseSession")]
			public abstract void release_session() throws DBusError, IOError;

			[DBus (name = "StartDiscovery")]
			public abstract void start_discovery() throws DBusError, IOError;

			[DBus (name = "StopDiscovery")]
			public abstract void stop_discovery() throws DBusError, IOError;

			[DBus (name = "ListDevices")]
			public abstract GLib.ObjectPath[] list_devices() throws DBusError, IOError;

			[DBus (name = "CreateDevice")]
			public abstract GLib.ObjectPath create_device(string address) throws DBusError, IOError;

			[DBus (name = "CreatePairedDevice")]
			public abstract GLib.ObjectPath create_paired_device(string address, GLib.ObjectPath agent, string capability) throws DBusError, IOError;

			[DBus (name = "CancelDeviceCreation")]
			public abstract void cancel_device_creation(string address) throws DBusError, IOError;

			[DBus (name = "RemoveDevice")]
			public abstract void remove_device(GLib.ObjectPath device) throws DBusError, IOError;

			[DBus (name = "FindDevice")]
			public abstract GLib.ObjectPath find_device(string address) throws DBusError, IOError;

			[DBus (name = "RegisterAgent")]
			public abstract void register_agent(GLib.ObjectPath agent, string capability) throws DBusError, IOError;

			[DBus (name = "UnregisterAgent")]
			public abstract void unregister_agent(GLib.ObjectPath agent) throws DBusError, IOError;

			[DBus (name = "PropertyChanged")]
			public signal void property_changed(string name, GLib.Variant value);

			[DBus (name = "DeviceCreated")]
			public signal void device_created(GLib.ObjectPath device);

			[DBus (name = "DeviceRemoved")]
			public signal void device_removed(GLib.ObjectPath device);

			[DBus (name = "DeviceFound")]
			public signal void device_found(string address, GLib.HashTable<string, GLib.Variant> values);

			[DBus (name = "DeviceDisappeared")]
			public signal void device_disappeared(string address);
		}

		[DBus (name = "org.bluez.Agent", timeout = 120000)]
		public interface Agent : GLib.Object {

			[DBus (name = "Authorize")]
			public abstract void authorize(GLib.ObjectPath device, string uuid) throws DBusError, IOError;

			[DBus (name = "RequestPinCode")]
			public abstract string request_pin_code(GLib.ObjectPath device) throws DBusError, IOError;

			[DBus (name = "DisplayPasskey")]
			public abstract void display_passkey(GLib.ObjectPath device, uint passkey) throws DBusError, IOError;

			[DBus (name = "Release")]
			public abstract void release() throws DBusError, IOError;

			[DBus (name = "Cancel")]
			public abstract void cancel() throws DBusError, IOError;

			[DBus (name = "RequestConfirmation")]
			public abstract void request_confirmation(GLib.ObjectPath device, uint passkey) throws DBusError, IOError;

			[DBus (name = "ConfirmModeChange")]
			public abstract void confirm_mode_change(string mode) throws DBusError, IOError;

			[DBus (name = "RequestPasskey")]
			public abstract uint request_passkey(GLib.ObjectPath device) throws DBusError, IOError;
		}

		[DBus (name = "org.bluez.Agent", timeout = 120000)]
		public interface AgentSync : GLib.Object {

			[DBus (name = "Authorize")]
			public abstract void authorize(GLib.ObjectPath device, string uuid) throws DBusError, IOError;

			[DBus (name = "RequestPinCode")]
			public abstract string request_pin_code(GLib.ObjectPath device) throws DBusError, IOError;

			[DBus (name = "DisplayPasskey")]
			public abstract void display_passkey(GLib.ObjectPath device, uint passkey) throws DBusError, IOError;

			[DBus (name = "Release")]
			public abstract void release() throws DBusError, IOError;

			[DBus (name = "Cancel")]
			public abstract void cancel() throws DBusError, IOError;

			[DBus (name = "RequestConfirmation")]
			public abstract void request_confirmation(GLib.ObjectPath device, uint passkey) throws DBusError, IOError;

			[DBus (name = "ConfirmModeChange")]
			public abstract void confirm_mode_change(string mode) throws DBusError, IOError;

			[DBus (name = "RequestPasskey")]
			public abstract uint request_passkey(GLib.ObjectPath device) throws DBusError, IOError;
		}

		[DBus (name = "org.bluez.Device", timeout = 120000)]
		public interface Device : GLib.Object {

			[DBus (name = "GetProperties")]
			public abstract GLib.HashTable<string, GLib.Variant> get_properties() throws DBusError, IOError;

			[DBus (name = "SetProperty")]
			public abstract void set_property(string name, GLib.Variant value) throws DBusError, IOError;

			[DBus (name = "DiscoverServices")]
			public abstract GLib.HashTable<uint, string> discover_services(string pattern) throws DBusError, IOError;

			[DBus (name = "CancelDiscovery")]
			public abstract void cancel_discovery() throws DBusError, IOError;

			[DBus (name = "Disconnect")]
			public abstract void disconnect() throws DBusError, IOError;

			[DBus (name = "PropertyChanged")]
			public signal void property_changed(string name, GLib.Variant value);

			[DBus (name = "DisconnectRequested")]
			public signal void disconnect_requested();
		}

		[DBus (name = "org.bluez.Device", timeout = 120000)]
		public interface DeviceSync : GLib.Object {

			[DBus (name = "GetProperties")]
			public abstract GLib.HashTable<string, GLib.Variant> get_properties() throws DBusError, IOError;

			[DBus (name = "SetProperty")]
			public abstract void set_property(string name, GLib.Variant value) throws DBusError, IOError;

			[DBus (name = "DiscoverServices")]
			public abstract GLib.HashTable<uint, string> discover_services(string pattern) throws DBusError, IOError;

			[DBus (name = "CancelDiscovery")]
			public abstract void cancel_discovery() throws DBusError, IOError;

			[DBus (name = "Disconnect")]
			public abstract void disconnect() throws DBusError, IOError;

			[DBus (name = "PropertyChanged")]
			public signal void property_changed(string name, GLib.Variant value);

			[DBus (name = "DisconnectRequested")]
			public signal void disconnect_requested();
		}
	}
}
