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
                'userTable' => 'yum_user',
                'translationTable' => 'yum_translation',
                ),
                'usergroup' => array(
                'usergroupTable' => 'yum_usergroup',
                'usergroupMessageTable' => 'yum_user_group_message',
                ),
                /*'membership' => array(
                'membershipTable' => 'yum_membership',
                'paymentTable' => 'yum_payment',
                ),*/
                'friendship' => array(
                'friendshipTable' => 'yum_friendship',
                ),
                'profile' => array(
                'privacySettingTable' => 'yum_privacysetting',
                'profileFieldTable' => 'yum_profile_field',
                'profileTable' => 'yum_profile',
                'profileCommentTable' => 'yum_profile_comment',
                'profileVisitTable' => 'yum_profile_visit',
                ),
                'role' => array(
                'roleTable' => 'yum_role',
                'userRoleTable' => 'yum_user_role',
                'actionTable' => 'yum_action',
                'permissionTable' => 'yum_permission',
                ),
                /*'message' => array(
                'messageTable' => 'yum_message',
                ),*/
                'registration' =>array(
                    'enableActivationConfirmation'=>true,
                ),
                'avatar',
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
			'connectionString' => 'mysql:host=localhost;dbname=yum',
			'emulatePrepare' => true,
			'username' => 'root',
			'password' => '',
			'charset' => 'utf8',
                        'tablePrefix' => 'yum_',
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