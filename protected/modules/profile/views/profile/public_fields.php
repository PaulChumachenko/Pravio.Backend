<?php if($profile && !$profile->isNewRecord && $profile->getPublicFields()) { ?>
<table class="table_profile_fields">
<!-- Sort all public fields by position value -->
<?php $publicFields = $profile->getPublicFields() ?>
<?php uasort($publicFields, array($profile, 'sort_fields'));?>
    
<?php foreach($publicFields as $field) { ?>    
        <?php if($field->title == 'Lastname') continue; ?>
	<tr>
	<th class="label"> <?php echo Yum::t($field->title); ?> </th> 
	<?php if($field->title == 'Sex') { ?>
            <td> <?php echo $profile->{$field->varname}==0 ? Yum::t('Male') : Yum::t('Female'); ?> </td>
        <?php } else if($field->title == 'Birthday') { ?>
            <td> <?php echo $profile->{$field->varname}=='0000-00-00' ? Yum::t('Not set') : $profile->{$field->varname}; ?> </td>
            <?php } else { ?>
                <td> <?php if($profile->{$field->varname} != NULL) echo CHtml::decode($profile->{$field->varname}); else echo Yum::t('Not set');  ?> </td>
            <?php } ?>
	</tr>

<?php } ?>
</table>
<?php } ?>

<div class="clear"></div>
