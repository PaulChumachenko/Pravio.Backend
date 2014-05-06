<?php

// uncomment the following to define a path alias
// Yii::setPathOfAlias('local','path/to/local-folder');

// This is the main Web application configuration. Any writable
// CWebApplication properties can be configured here.
return array(
	'basePath'=>dirname(__FILE__).DIRECTORY_SEPARATOR.'..',
	'name'=>'My Web Application',

	// preloading 'log' component
	'preload'=>array('log'),

	// autoloading model and component classes
	'import'=>array(
		'application.models.*',
		'application.components.*',
                'application.modules.user.models.*',
	),

	'modules'=>array(
		'user' => array(
                'debug' => false,
                'userTable' => 'pravdb_user',
                'translationTable' => 'pravdb_translation',
                ),
                'usergroup' => array(
                'usergroupTable' => 'pravdb_usergroup',
                'usergroupMessageTable' => 'pravdb_user_group_message',
                ),
                /*'membership' => array(
                'membershipTable' => 'pravdb_membership',
                'paymentTable' => 'pravdb_payment',
                ),*/
                'friendship' => array(
                'friendshipTable' => 'pravdb_friendship',
                ),
                'profile' => array(
                'privacySettingTable' => 'pravdb_privacysetting',
                'profileFieldTable' => 'pravdb_profile_field',
                'profileTable' => 'pravdb_profile',
                'profileCommentTable' => 'pravdb_profile_comment',
                'profileVisitTable' => 'pravdb_profile_visit',
                ),
                /*'role' => array(
                'roleTable' => 'pravdb_role',
                'userRoleTable' => 'pravdb_user_role',
                'actionTable' => 'pravdb_action',
                'permissionTable' => 'pravdb_permission',
                ),*/
                /*'message' => array(
                'messageTable' => 'pravdb_message',
                ),*/
                'registration' =>array(
                    'enableActivationConfirmation'=>true,
                ),
                'avatar',
            
                'gii'=>array(
			'class'=>'system.gii.GiiModule',
			'password'=>'0000',
			// If removed, Gii defaults to localhost only. Edit carefully to taste.
			'ipFilters'=>array('127.0.0.1','::1'),
		),
	),
    	

	// application components
	'components'=>array(
		'user'=>array(
                    'class' => 'application.modules.user.components.YumWebUser',
                    'allowAutoLogin'=>true,
                    'loginUrl' => array('//user/user/login'),
                  ),
                'cache' => array('class' => 'system.caching.CDummyCache'),
		// uncomment the following to enable URLs in path-format
		/*
		'urlManager'=>array(
			'urlFormat'=>'path',
			'rules'=>array(
				'<controller:\w+>/<id:\d+>'=>'<controller>/view',
				'<controller:\w+>/<action:\w+>/<id:\d+>'=>'<controller>/<action>',
				'<controller:\w+>/<action:\w+>'=>'<controller>/<action>',
			),
		),
		*/
		/*'db'=>array(
			'connectionString' => 'sqlite:'.dirname(__FILE__).'/../data/testdrive.db',
		),*/
		// uncomment the following to use a MySQL database
		
		'db'=>array(
			'connectionString' => 'mysql:host=localhost;dbname=pravio',
			'emulatePrepare' => true,
			'username' => 'root',
			'password' => '',
			'charset' => 'utf8',
                        'tablePrefix' => 'pravdb_',
		),
		
		'errorHandler'=>array(
			// use 'site/error' action to display errors
			'errorAction'=>'site/error',
		),
		'log'=>array(
			'class'=>'CLogRouter',
			'routes'=>array(
				array(
					'class'=>'CFileLogRoute',
					'levels'=>'error, warning',
				),
				// uncomment the following to show log messages on web pages
				/*
				array(
					'class'=>'CWebLogRoute',
				),
				*/
			),
		),
            // enable for widget customization  
            /*   
            'widgetFactory' => array(
                'enableSkin' => true,
            ),*/
	),

	// application-level parameters that can be accessed
	// using Yii::app()->params['paramName']
	'params'=>array(
		// this is used in contact page
		'adminEmail'=>'webmaster@example.com',
	),
);