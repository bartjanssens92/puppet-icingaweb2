# == Class icingaweb2::params
#
class icingaweb2::params {
  # Module variables
  $git_repo            = 'https://git.icinga.org/icingaweb2.git'
  $git_revision        = undef
  $install_method      = 'git'
  $manage_apache_vhost = false
  $manage_repo         = false

  # Template variables
  $admin_permissions = '*'
  $admin_users       = 'icingaadmin'
  $auth_backend      = 'db'
  $auth_resource     = 'icingaweb_db'
  $ido_db            = 'mysql'
  $ido_db_host       = 'localhost'
  $ido_db_name       = 'icingaweb2'
  $ido_db_pass       = 'icingaweb2'
  $ido_db_port       = '3306'
  $ido_db_user       = 'icingaweb2'
  $ido_type          = 'db'
  $log_application   = 'icingaweb2'
  $log_level         = 'ERROR'
  $log_method        = 'syslog'
  $log_resource      = 'icingaweb_db'
  $log_store         = 'db'
  $web_db            = 'mysql'
  $web_db_host       = 'localhost'
  $web_db_name       = 'icingaweb2'
  $web_db_pass       = 'icingaweb2'
  $web_db_port       = '3306'
  $web_db_prefix     = 'icingaweb2_'
  $web_db_user       = 'icingaweb2'
  $web_type          = 'db'

  case $::osfamily {
    'RedHat': {
      $config_dir         = '/etc/icingaweb2'
      $config_dir_mode    = '0755'
      $config_dir_recurse = false
      $config_file_mode   = '0644'
      $config_group       = 'icingaweb2'
      $config_user        = 'icingaweb2'
      $pkg_ensure         = present
      $pkg_list           = []
      $web_root           = '/usr/share/icingaweb2'

      $pkg_deps = [
        'php-gd',
        'php-intl',
        'php-ldap',
        'php-mysql',
        'php-pecl-imagick',
        'php-pgsql',
      ]
    }

    'Debian': {
      $config_dir         = '/etc/icingaweb2'
      $config_dir_mode    = '0755'
      $config_dir_recurse = false
      $config_file_mode   = '0644'
      $config_group       = 'icingaweb2'
      $config_user        = 'icingaweb2'
      $pkg_ensure         = present
      $pkg_list           = []
      $web_root           = '/usr/share/icingaweb2'

      $pkg_deps = [
        'php5-gd',
        'php5-imagick',
        'php5-intl',
        'php5-ldap',
        'php5-mysql',
        'php5-pgsql',
      ]
    }

    default: {
      fail "Operating system ${::operatingsystem} is not supported."
    }
  }
}

