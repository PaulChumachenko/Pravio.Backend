<?php

/**
 * Description of AskController
 *
 * @author Anton
 */
class AskController extends Controller {
       
    /**
     * This action implements when user asks a question
     */
    public function actionIndex() {
        $model = new Question;
        $this->render('index', array('model' => $model));
    }
    
}
