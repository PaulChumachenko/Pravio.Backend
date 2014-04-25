<?php
/* @var $this AskController */
/* @var $model Question */
/* @var $form CActiveForm  */

$this->pageTitle=Yii::app()->name . ' - Ask Question';

?>

<h1>Ask Question</h1>

<p>Ask your question here:</p>

<div class="form">
<?php $form=$this->beginWidget('CActiveForm', array(
	'id'=>'question-form',
	'enableClientValidation'=>true,
	'clientOptions'=>array(
		'validateOnSubmit'=>true,
	),
)); ?>

	<p class="note">Fields with <span class="required">*</span> are required.</p>

	<div class="row">
		<?php echo $form->labelEx($model,'topic'); ?>
		<?php echo $form->textField($model,'topic'); ?>
		<?php echo $form->error($model,'topic'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'question'); ?>
		<?php echo $form->textArea($model,'question'); ?>
		<?php echo $form->error($model,'question'); ?>
	</div>

	<div class="row buttons">
            <input type="submit" value="Ask">
            <input type="reset">
	</div>

<?php $this->endWidget(); ?>
</div><!-- form -->