<?php 
if(Yum::module()->rtepath != false)
Yii::app()->clientScript-> registerScriptFile(Yum::module()->rtepath);                                                                         
if(Yum::module()->rteadapter != false)
Yii::app()->clientScript-> registerScriptFile(Yum::module()->rteadapter); 


if($profile)
{
    $profileFields = $profile->loadProfileFields();
    uasort($profileFields, array($profile, 'sort_fields'));
    foreach($profileFields as $field) {
            echo CHtml::openTag('div',array('class'=>'row'));

            if($field->hint)
                    echo CHtml::tag('div',array('class'=>'hint'),$field->hint,true);

            //Now hide the Last Name label
            if ($field->varname != "lastname") 
                echo CHtml::activeLabelEx($profile, $field->varname);

            if ($field->field_type=='BOOLEAN') {
                    echo CHtml::activeCheckBox($profile, $field->varname);
            } 
            else if ($field->field_type=="TEXT") {
                    echo CHtml::activeTextArea($profile,
                                    $field->varname,
                                    array('rows'=>6, 'cols'=>50));
            } 
            else if($field->field_type == "DROPDOWNLIST") {
                    echo CHtml::activeDropDownList($profile,
                                    $field->varname, 
                                    CHtml::listData(CActiveRecord::model(ucfirst($field->varname))->findAll(),
                                            'id',
                                            $field->related_field_name));

            }
            else if($field->field_type == "DATE") {
                $this->widget('zii.widgets.jui.CJuiDatePicker', array(
                    'model' => $profile,
                    'attribute' => 'birthday',
                    'language' => 'uk',
                    'options' => array(
                       'dateFormat' => 'yy-mm-dd',
                        'showAnim'=>'slide',
                        'changeMonth'=>true,
                        'changeYear'=>true,
                        'yearRange'=>'1950:2010',

                    ),
                    'htmlOptions' => array(
                        'size' => '25',         // textField size
                        'maxlength' => '10',    // textField maxlength
                    ),
                ));
                            /*echo CHtml::textField('datepicker');            
                $this->widget('application.widgets.JalaliDatePicker.JalaliDatePicker',array('textField'=>'datepicker',	
                      'options'=>array(
                              'changeMonth'=>'true',
                              'changeYear'=>'true',
                              'showButtonPanel'=>'true',
                      )
               ));*/         

            }
            else {
                    // Lets do some magic with SEX-field
                    if ($field->varname == 'sex')
                    {
                        echo CHtml::activeTextField($profile,
                                    $field->varname,
                                    array('size'=>(($field->field_size_min)?$field->field_size_min:25),'maxlength'=>(($field->field_size)?$field->field_size:255), 'style'=>'display:none;', 'id'=>'sexInp'));
                        echo 'Male';

                        //Here we have a a strange structure, with which we initialize the switch, depending on the current state of gender

                        if ($profile->sex == '0') {
                        ?>
                            <img src="<?php echo (Yii::app()->request->baseUrl.'/images/male.jpg');  ?>" onclick='javascript: imgchangeMale(this,"<? echo (Yii::app()->request->baseUrl.'/images/male.jpg');  ?>","<? echo (Yii::app()->request->baseUrl.'/images/female.jpg');  ?>");' style='max-height: 21px; cursor: pointer;' />            
                        <?php
                        } else { 
                        ?>
                            <img src="<?php echo (Yii::app()->request->baseUrl.'/images/female.jpg');  ?>" onclick='javascript: imgchangeFemale(this,"<? echo (Yii::app()->request->baseUrl.'/images/male.jpg');  ?>","<? echo (Yii::app()->request->baseUrl.'/images/female.jpg');  ?>");' style='max-height: 21px; cursor: pointer;' />
                        <?php               
                        }           

                        echo 'Female';                                                    
                    }
                    else if($field->varname == 'lastname')
                    {
                        //Now hide the Last Name input field with adding display:none                    
                        echo CHtml::activeTextField($profile,
                                    $field->varname,
                                    array('size'=>(($field->field_size_min)?$field->field_size_min:25),'maxlength'=>(($field->field_size)?$field->field_size:255), 'style'=>'display:none;'));                                         
                    }
                    else
                    {
                         echo CHtml::activeTextField($profile,
                                    $field->varname,
                                    array('size'=>(($field->field_size_min)?$field->field_size_min:25),'maxlength'=>(($field->field_size)?$field->field_size:255)));  
                    }
            }
            echo CHtml::error($profile,$field->varname); 

            echo CHtml::closeTag('div');
    }
}
?>

<script>
    var x=false;
    function imgchangeMale(obj,imgX,imgY) 
    {
      if  (x)
      {
          obj.src=imgX;
          $('#sexInp').val('0');          
      } 
      else 
      {
          obj.src=imgY;
          $('#sexInp').val('1');         
      }
      x=!x
    }
    
    var y=true;
    function imgchangeFemale(obj,imgX,imgY) 
    {
      if  (y)
      {
          obj.src=imgX;
          $('#sexInp').val('0');          
      } 
      else 
      {
          obj.src=imgY;
          $('#sexInp').val('1');         
      }
      y=!y
    }

</script>
