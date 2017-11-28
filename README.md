## DEPRECATED!
### Use [webcore-cms](https://github.com/dandisy/webcore-cms) instead

### DynamicCMS
#### The CodeIgniter Application Integrated with HMVC, Twig and Doctrine ORM
##### Featured with dynamic routes, dynamic controllers and dynamic views from database

This is rbz/codeigniter project for developing blank buildable CMS for blog, portal, e-commerce, etc.
Using single platform.

##### Note :
    If you want only CodeIgniter integrated with HMVC, Twig and Doctrine,
    but not the codes part of DynamicCMS, you can clone version 1.1.0
    or clone this version and remove unwanted codes by your self.

    also you can edit composer.json to exclude unwanted packages (Twig or Doctrine).

    But for excluded HMVC you must manually delete the file in core and third_party folder,
    because this part included manually, not using composer.

1. Preparation

    Just read CodeIgniter documentation to begin CI based website, if you not familiar.

2. Installation
    * Git

        Clone this git project to your web root

            git clone https://github.com/dandisy/dynamicCMS.git

        Go to the folder and run

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

4. Twig Implementation

    Is configured to read View with .twig as file extention in each module ,
    if you want to Twig read other directory or file extention, you must change configuration in Twig.php library.

5. CodeIgniter Implementation

    For security reason the index.php have been moved to public folder, whereas CodeIgniter system file in outside web root directory.
    You must set the web root to this public directory.

        
by dandi@redbuzz.co.id
