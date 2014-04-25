<div class="view" style="float: left;margin-right: 10px;">
<?php echo CHtml::link($data->getAvatar(true), array(
			'//avatar/avatar/editAvatar', 'id' => $data->id)); ?> 
<?php echo CHtml::link($data->profile->firstname, array(
			'//avatar/avatar/editAvatar', 'id' => $data->id, 'style'=>'font-size:10pt !important;')); ?>
</div>

