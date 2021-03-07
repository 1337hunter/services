<?php
define( 'DB_NAME', 'wpdb' );
define( 'DB_USER', 'gbright' );
define( 'DB_PASSWORD', 'admin' );
define( 'DB_HOST', '10.96.100.10' );
define( 'DB_CHARSET', 'utf8' );
define('DB_COLLATE', '');
define('FS_METHOD', 'direct' );

define('AUTH_KEY',         'NvS{]EY=!7IH%ipixCTn7r<&@)k~kT#F#pZ5L1JU!BKDEK_{a+<docs**f{/%`|>');
define('SECURE_AUTH_KEY',  'SBGK4|1xq6R?[~ DU6Zi=5@]0X~VHi|T-GW%y!aBt+l3D^:U`:B:ZYFTnWcFAAvf');
define('LOGGED_IN_KEY',    '/hMY<Ot_9PmNSrl=Cm1?h5y6f7{mi`e*1bd)>T L&2KF`eW{i- vatlcVLepb!*J');
define('NONCE_KEY',        '4R.u/VzH6o 1Hx)RoIB?~zz`2A|Ql!fI|-b+5U|m+eVu)qQ LQGvgVbWkd|i2w7%');
define('AUTH_SALT',        'pns<V-n%J$O2kDF|Y;z!dnr*>`FRysxJBkj-|`37*N-DYP6i0^yZS|D!L>g--zc]');
define('SECURE_AUTH_SALT', ' gL6S|t/ND[3xw_&3w v5<1ra6]Ib/BI|TFTl|If9}-Q-np[fgel[Ks+7ot7b[-f');
define('LOGGED_IN_SALT',   'qskHIPNu2Jj~mPYwb.PbbFhk(I.Xq~V#aH,9JQ/lbQj!}.A[UHQf;a)JTX{9ipI@');
define('NONCE_SALT',       ']6c;~A8V%%g@T*x^zS6b|_^7#X- x&_$VOOrbHwLDIA+1MB4><Si1nA2Z@0eU/,R');

$table_prefix  = 'wp_';
define('WP_DEBUG', false);

if ( !defined('ABSPATH') )
	define('ABSPATH', dirname(__FILE__) . '/');

require_once(ABSPATH . 'wp-settings.php');
?>
