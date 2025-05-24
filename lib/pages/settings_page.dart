import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _notificationsEnabled = true;
  bool _darkModeEnabled = true;
  bool _autoSaveEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1A1A2E),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              SizedBox(height: 24),
              _buildGeneralSection(),
              SizedBox(height: 24),
              _buildNotificationSection(),
              SizedBox(height: 24),
              _buildAccountSection(),
              SizedBox(height: 24),
              _buildAboutSection(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        Text(
          'Ajustes',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        Spacer(),
        Icon(Icons.settings, color: Color(0xFF3282B8), size: 32),
      ],
    );
  }

  Widget _buildGeneralSection() {
    return _buildSection(
      title: 'General',
      children: [
        _buildSwitchTile(
          title: 'Modo Oscuro',
          subtitle: 'Usar tema oscuro en la aplicación',
          value: _darkModeEnabled,
          onChanged: (value) => setState(() => _darkModeEnabled = value),
          icon: Icons.dark_mode,
        ),
        _buildSwitchTile(
          title: 'Guardado Automático',
          subtitle: 'Guardar cambios automáticamente',
          value: _autoSaveEnabled,
          onChanged: (value) => setState(() => _autoSaveEnabled = value),
          icon: Icons.save,
        ),
      ],
    );
  }

  Widget _buildNotificationSection() {
    return _buildSection(
      title: 'Notificaciones',
      children: [
        _buildSwitchTile(
          title: 'Notificaciones Push',
          subtitle: 'Recibir notificaciones de dispositivos',
          value: _notificationsEnabled,
          onChanged: (value) => setState(() => _notificationsEnabled = value),
          icon: Icons.notifications,
        ),
        _buildSettingTile(
          title: 'Sonidos',
          subtitle: 'Configurar sonidos de notificación',
          icon: Icons.volume_up,
          onTap: () {
            // Navegar a configuración de sonidos
          },
        ),
      ],
    );
  }

  Widget _buildAccountSection() {
    return _buildSection(
      title: 'Cuenta',
      children: [
        _buildSettingTile(
          title: 'Perfil',
          subtitle: 'Editar información personal',
          icon: Icons.person,
          onTap: () {
            // Navegar a perfil
          },
        ),
        _buildSettingTile(
          title: 'Seguridad',
          subtitle: 'Contraseña y autenticación',
          icon: Icons.security,
          onTap: () {
            // Navegar a seguridad
          },
        ),
        _buildSettingTile(
          title: 'Privacidad',
          subtitle: 'Configuración de privacidad',
          icon: Icons.privacy_tip,
          onTap: () {
            // Navegar a privacidad
          },
        ),
      ],
    );
  }

  Widget _buildAboutSection() {
    return _buildSection(
      title: 'Acerca de',
      children: [
        _buildSettingTile(
          title: 'Ayuda',
          subtitle: 'Centro de ayuda y soporte',
          icon: Icons.help,
          onTap: () {
            // Navegar a ayuda
          },
        ),
        _buildSettingTile(
          title: 'Términos y Condiciones',
          subtitle: 'Leer términos de uso',
          icon: Icons.description,
          onTap: () {
            // Mostrar términos
          },
        ),
        _buildSettingTile(
          title: 'Versión',
          subtitle: 'Smart Control v1.0.0',
          icon: Icons.info,
          onTap: null,
        ),
      ],
    );
  }

  Widget _buildSection({
    required String title,
    required List<Widget> children,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 12),
        Container(
          decoration: BoxDecoration(
            color: Color(0xFF16213E),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(children: children),
        ),
      ],
    );
  }

  Widget _buildSwitchTile({
    required String title,
    required String subtitle,
    required bool value,
    required ValueChanged<bool> onChanged,
    required IconData icon,
  }) {
    return ListTile(
      leading: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Color(0xFF3282B8).withOpacity(0.2),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, color: Color(0xFF3282B8), size: 20),
      ),
      title: Text(
        title,
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(color: Colors.grey, fontSize: 12),
      ),
      trailing: Switch(
        value: value,
        onChanged: onChanged,
        activeColor: Color(0xFF3282B8),
      ),
    );
  }

  Widget _buildSettingTile({
    required String title,
    required String subtitle,
    required IconData icon,
    VoidCallback? onTap,
  }) {
    return ListTile(
      leading: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Color(0xFF3282B8).withOpacity(0.2),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, color: Color(0xFF3282B8), size: 20),
      ),
      title: Text(
        title,
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(color: Colors.grey, fontSize: 12),
      ),
      trailing:
          onTap != null ? Icon(Icons.chevron_right, color: Colors.grey) : null,
      onTap: onTap,
    );
  }
}
