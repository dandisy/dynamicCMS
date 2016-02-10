### rbz/codeigniter
#### The CodeIgniter Application Integrated with HMVC, Twig and Doctrine ORM

1. Preparation

    This project (for quick starting) has been set for MySQL Database with the following :

        database name = ci3hmvc
        user name = root
        password =

    For quick starting, you just create like above database in your own, or if you wont you can configure database your self.

2. Installation
    * Git

        Clone this git project to your web root, go to the folder and run

            composer install

    * Composer

        Run

            composer create-project rbz/codeigniter:dev-master your-project-folder-name

        or just run (to get the latest stable version)

            composer create-project rbz/codeigniter your-project-folder-name

    End than run in browser :

        your-hostname/folder-name or your-project-folder-name/public

3. How to use Doctrine ORM
    * To generate schema from entities (code first) :        
        - create entities in models/entities, example:
        
                <?php
                /**
                 * @Entity @Table(name="products")
                 **/
                class Product
                {
                    /** @Id @Column(type="integer") @GeneratedValue **/
                    protected $id;
                    
                    /** @Column(type="string") **/
                    protected $name;
                
                    public function getId()
                    {
                        return $this->id;
                    }
                
                    public function getName()
                    {
                        return $this->name;
                    }
                
                    public function setName($name)
                    {
                        $this->name = $name;
                    }
                }
        
        - in terminal :

                ./vendor/bin/doctrine orm:schema-tool:create
        
    * To generate entities from database (database first)
        - in terminal :

            first, generate the mapping annotation
            
                ./vendor/bin/doctrine orm:convert-mapping --from-database annotation models/entities
            
            then, generate the entities
            
                ./vendor/bin/doctrine orm:generate-entities --generate-annotations=true --generate-methods=true models/entities
            
            the last, ensure that the entities class that is generated is not the same as an existing class(ei: controllers class, or models class),
            if there are the same as the one, you need manually change for :

                - class name
                - annotation refered
                - file name        

4. Using Twig

    Twig implementation is set to read view with .twig as file extention in each module ,
    if you want to Twig read other directory or file extention, you must change configuration in Twig.php library.

5. CodeIgniter Implementation

    For security reason the index.php have been moved to public folder, whereas CodeIgniter system file in outside web root directory.
    You must set the web root to this public directory.

        
by dandi@redbuzz.co.id