<?php

class QuestionController extends Controller
{
	public function actionIndex()
	{
		$this->render('index');
	}
        
        
        /**
         * This action implements when user asks a question
         */
        public function actionAsk() {
            $this->render('ask');
        }
}