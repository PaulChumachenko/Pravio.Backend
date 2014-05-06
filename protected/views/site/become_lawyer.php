<div>
    <?php echo Yum::t("To become a lawyer, you have to download a scanned document (license, diploma, certificate, etc.), which confirms the specialization."); ?>
</div>

<div class="form">
   
<div class="row">
    <?php echo $modMyModel->id_image ?>
    <?php echo CHtml::activeFileField($modMyModel, 'id_image_file'); ?>
<?
/*echo CHtml::errorSummary($model);
echo CHtml::beginForm(array(
                        '//avatar/avatar/editAvatar', 'id' => $model->id), 'POST', array(
'enctype' => 'multipart/form-data'));
echo '<div class="row">';
echo CHtml::activeLabelEx($model, 'avatar');
echo CHtml::activeFileField($model, 'avatar');
echo CHtml::error($model, 'avatar');
echo '</div>';
*/

echo CHtml::submitButton(Yum::t('Send request'));
echo '&nbsp';
echo CHtml::link(Yum::t('Cancel'), array('//profile/profile/view'));
?>

</div>

<? //echo CHtml::endForm(); ?>

<div style="clear: both;"> </div>


