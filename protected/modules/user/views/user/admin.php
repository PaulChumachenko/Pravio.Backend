<?
$this->title = Yum::t('Manage users');

$this->breadcrumbs = array(
	Yum::t('User administration'));

echo Yum::renderFlash();

$this->widget('application.modules.user.components.CsvGridView', array(
	'dataProvider'=>$model->search(),
	'filter' => $model,
		'columns'=>array(
			/*array(
				'name'=>'id',                                
				'filter' => false,
				'type'=>'raw',
                                'value'=>'$data->id'
				//'value'=>'CHtml::link($data->id,
				//array("//user/user/update","id"=>$data->id))',
				),*/
			array(
				'name'=>'username',
                                'header' => 'Name & Surname',
				'type'=>'raw',
                                'value'=>'$data->profile->firstname',
				//'value'=>'CHtml::link(CHtml::encode($data->profile->firstname),
				//array("//user/user/view","id"=>$data->id))',
			),
			array(
				'name'=>'createtime',
				'filter' => false,
				'value'=>'date(UserModule::$dateFormat,$data->createtime)',
			),
			array(
				'name'=>'lastvisit',
				'filter' => false,
				'value'=>'date(UserModule::$dateFormat,$data->lastvisit)',
			),
			array(
				'name'=>'status',
				'filter' => false,
				'value'=>'YumUser::itemAlias("UserStatus",$data->status)',
			),
			array(
				'name'=>Yum::t('Roles'),
				'type' => 'raw',
				'visible' => Yum::hasModule('role'),
				'filter' => false,
				'value'=>'$data->getRoles()',
			),
			array(
				'class'=>'CButtonColumn',
			),
))); ?>

<?php echo CHtml::link(Yum::t('Create new User'), array(
			'//user/user/create')); ?>

