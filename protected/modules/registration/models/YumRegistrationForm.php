<?
/**
 * RegistrationForm class.
 * RegistrationForm is the data structure for keeping
 * user registration form data. It is used by the 'registration' action of 
 * 'YumRegistrationController'.
 * @package Yum.models
 */
class YumRegistrationForm extends YumUser {
	public $email;
	public $newsletter;
	public $username;
	public $password;
	public $street;
	public $city;
	public $telephone;
	public $verifyPassword;
	public $verifyCode; // Captcha
        public $chBoxAgree;

	public function rules() 
	{
		$rules = parent::rules();

		/* FIXME: As soon as i grasp how i can dynamically add variables to a 
			 class in PHP, i will enable this code snippet for flexibility:

			 $profile = new YumProfile;
			 $profile_rules = $profile->rules();
			 foreach($profile_rules as $rule) 
			 if(isset($rule[0]) && is_string($rule[0]))
			 $this->${$rule[0]} = ''; 

			 $rules = array_merge($rules, $profile->rules());	 */

		//$rules[] = array('username', 'required');
                $rules[] = array('username', 'safe');
		$rules[] = array('password, verifyPassword', 'required');
		$rules[] = array('password', 'compare',
				'compareAttribute'=>'verifyPassword',
				'message' => Yum::t("Retype password is incorrect."));
		if(Yum::module('registration')->enableCaptcha)
                {
                    $rules[] = array('verifyCode', 'captcha',
					'allowEmpty'=>CCaptcha::checkRequirements()); 
                    $rules[] = array('verifyCode', 'required');
                    
                }			                        
                $rules[] = array('chBoxAgree', 'mustCheck');

		return $rules;
	}
        
        public function mustCheck($attribute, $params)
        {
            if ($this->chBoxAgree != 0)
                return;
            else
                $this->addError('', Yum::t("You should agree with the Terms"));
        }

	public static function genRandomString($length = 10)
	{
		$characters = '0123456789abcdefghijklmnopqrstuvwxyz';
		$string ='';    
		for ($p = 0; $p < $length; $p++)
		{
			$string .= $characters[mt_rand(0, strlen($characters)-1)];
		}
		return $string;
	}
}
