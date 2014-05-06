<?
if(!$profile = $model->profile)
	$profile = new YumProfile;


$this->pageTitle = Yum::t('Profile');
$this->title = CHtml::activeLabel($model,'username');
$this->breadcrumbs = array(Yum::t('Profile'), $model->profile->firstname);
Yum::renderFlash();
?>

<div id="profile">
<?php echo $model->getAvatar(); ?>
<?php $this->renderPartial(Yum::module('profile')->publicFieldsView, array(
			'profile' => $model->profile)); ?>
<br />

<?
if(Yum::hasModule('friendship'))
$this->renderPartial(
		'application.modules.friendship.views.friendship.friends', array(
			'model' => $model)); ?>
<br />
<?
if(@Yum::module('message')->messageSystem != 0)
$this->renderPartial('/message/write_a_message', array(
			'model' => $model)); ?>
<br />

<div class="clear"></div>

<?php
if(Yum::module('profile')->enableProfileComments
		&& Yii::app()->controller->action->id != 'update'
		&& isset($model->profile))
	$this->renderPartial(Yum::module('profile')->profileCommentIndexView, array(
			 'model' => $model->profile)); ?>
 </div>

<?
 if(!Yii::app()->user->isGuest && Yii::app()->user->id == $model->id) {     
        if($model->isLawyer())
            echo Yum::t("<h2>You are a lawyer.</h2>");
        else
            echo CHtml::link(Yum::t("Become a lawyer"), array('//user/user/becomeLawyer'));
        
	echo "<br />";
        echo CHtml::link(Yum::t('Edit profile'), array('//profile/profile/update'));
	echo '&nbsp;';
	echo CHtml::link(Yum::t('Upload avatar image'), array('//avatar/avatar/editAvatar'));
}

