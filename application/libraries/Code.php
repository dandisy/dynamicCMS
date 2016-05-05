<?php
defined('BASEPATH') OR exit('No direct script access allowed');

//require APPPATH.'../vendor/autoload.php';

use Memio\Memio\Config\Build;
use Memio\Model\File;
use Memio\Model\Object;
use Memio\Model\Property;
use Memio\Model\Method;
use Memio\Model\Argument;

class Code
{
    public function generator()
    {
        // Describe the code you want to generate using "Models"
        $file = File::make('MyService.php')
            ->setStructure(
                Object::make('MyService')
                    ->addProperty(new Property('createdAt'))
                    ->addProperty(new Property('filename'))
                    ->addMethod(
                        Method::make('__construct')
                            ->addArgument(new Argument('DateTime', 'createdAt'))
                            ->addArgument(new Argument('string', 'filename'))
                    )
            );

        // Generate the code and display in the console
        $prettyPrinter = Build::prettyPrinter();
        /*$generatedCode = $prettyPrinter->generateCode($file);
        echo $generatedCode;*/
        echo '<pre>'.htmlspecialchars($prettyPrinter->generateCode($file)).'</pre>';
    }
}

// end of file