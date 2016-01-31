### rbz/codeigniter
#### The CodeIgniter Application Integrated with HMVC, Twig and Doctrine ORM

1. Installation
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

2. How to use Doctrine ORM
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
            
                ./vendor/bin/doctrine orm:convert-mapping --from-database annotation models/mappings
            
            then, generate the entities
            
                ./vendor/bin/doctrine orm:generate-entities --generate-annotations=true --generate-methods=true models/entities
            
            last, ensure the generated class for entity not same with existing one(ei: controller class, or model class)
            if same with other one, you need manually change:
                - class name
                - annotation refered
                - file name        

3. Using Twig

    Twig implementation is set to read view with .twig as file extention in each module ,
    if you want to Twig read other directory or file extention, you must change configuration in Twig.php library.

4. CodeIgniter Implementation

    For security reason the index.php have been moved to public folder, and system file in outside web root directory.
    You must set the web root directory to this public folder.

        
by dandi@redbuzz.co.id