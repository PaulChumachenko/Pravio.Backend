
<h2> <?php echo Yum::t('Registration'); ?> </h2>

<?php $this->breadcrumbs = array(Yum::t('Registration')); ?>

<div class="form">
<?php $activeform = $this->beginWidget('CActiveForm', array(
			'id'=>'registration-form',
			'enableAjaxValidation'=>true,
			'enableClientValidation'=>true,
			'focus'=>array($form,'username'),
			));
?>

<?php echo Yum::requiredFieldNote(); ?>
<?php echo CHtml::errorSummary(array($form, $profile)); ?>

<!-- div class="row"> <?
//echo $activeform->labelEx($form,'username');
//echo $activeform->textField($form,'username');
?> </div-->

<div class="row"> <?
echo $activeform->labelEx($profile,'email');
echo $activeform->textField($profile,'email');
?> </div>  

<div class="row"> <?
echo $activeform->labelEx($profile,'firstname');
echo $activeform->textField($profile,'firstname');
?> </div>  

<div class="row"> <?
echo $activeform->labelEx($profile,'sex');
echo $activeform->textField($profile,'sex', array('id'=>'sexInput', 'style'=>'display: none;'));
?>
Male
<img src="<? echo (Yii::app()->request->baseUrl.'/images/male.jpg');  ?>" onclick='javascript: imgchange(this,"<? echo (Yii::app()->request->baseUrl.'/images/male.jpg');  ?>","<? echo (Yii::app()->request->baseUrl.'/images/female.jpg');  ?>");' style='max-height: 21px;' />
Female
</div>  
    
<!--div class="row"> <?
//echo $activeform->labelEx($profile,'lastname');
//echo $activeform->textField($profile,'lastname');
?> </div-->  

<div class="row">
<?php echo $activeform->labelEx($form,'password'); ?>
<?php echo $activeform->passwordField($form,'password'); ?>
</div>

<div class="row">
<?php echo $activeform->labelEx($form,'verifyPassword'); ?>
<?php echo $activeform->passwordField($form,'verifyPassword'); ?>
</div>

<?php if(extension_loaded('gd') 
			&& Yum::module('registration')->enableCaptcha): ?>
	<div class="row">
		<?php echo CHtml::activeLabelEx($form,'verifyCode'); ?>
		<div>
		<?php $this->widget('CCaptcha'); ?>
		<?php echo CHtml::activeTextField($form,'verifyCode'); ?>
		</div>
		<p class="hint">
		<?php echo Yum::t('Please enter the letters as they are shown in the image above.'); ?>
		<br/><?php echo Yum::t('Letters are not case-sensitive.'); ?></p>
	</div>
	<?php endif; ?>


        <div>
		<?php echo $activeform->checkBox($form, 'chBoxAgree', array('id'=>'chBoxAgr'));
                echo Yum::t(' I agree to the Terms. I already have 16 years.');?>
		
	</div>
	
	<div class="row submit">
		<?php echo CHtml::submitButton(Yum::t('Registration')); ?>
                <INPUT TYPE=RESET VALUE="<? echo Yum::t('Start over'); ?>"> 
	</div>

        <div class="row">
            <?php
                echo Yum::t('Already have an account? ');          
                echo CHtml::link(Yum::t("Sign in"),
			Yum::module('user')->loginUrl);
            ?>
                
        </div>

<?php $this->endWidget(); ?>
</div><!-- form -->


<script>
    var x=false;
    function imgchange(obj,imgX,imgY) 
    {
      if  (x)
      {
          obj.src=imgX;
          $('#sexInput').val('0');          
      } 
      else 
      {
          obj.src=imgY;
          $('#sexInput').val('1');         
      }
      x=!x
    }

</script>