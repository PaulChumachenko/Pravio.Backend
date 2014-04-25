<?php

class m140425_115303_create_question_table extends CDbMigration
{
	public function up()
	{
            $this->createTable('{{question}}', array(
                'id'=>'pk',
                'topic'=>'string not null',
                'question'=>'text not null',
                'author'=>'int UNSIGNED not null',
                'private'=>'boolean'
            ));
            
            $this->addForeignKey('author_fk_user_id', '{{question}}', 'author', '{{user}}', 'id', 'CASCADE', 'CASCADE');
	}

	public function down()
	{
            $this->dropForeignKey('author_fk_user_id', '{{question}}');
            
            $this->dropTable('{{question}}');
	}
        
}