<?php
defined('BASEPATH') OR exit('No direct script access allowed');

//require APPPATH.'../vendor/autoload.php';

use Memio\Memio\Config\Build;
use Memio\Model\File;
use Memio\Model\Object;
use Memio\Model\Property;
use Memio\Model\Method;
use Memio\Model\Argument;

class Codegenerator
{
    private $_class;
    private $_method;

    public function generate($class, $param = NULL)
    {
        // Describe the code you want to generate using "Models"
        $this->_class = Object::make(ucfirst($class));

        if($param['property'] !== NULL)
        {
            if(is_array($param['property']))
            {
                foreach($param['property'] as $property)
                {
                    $this->_class->addProperty(Property::make($property));
                }
            }
            elseif(is_string($param['property']))
            {
                $this->_class->addProperty(Property::make($param['property']));
            }
        }

        if($param['method'] !== NULL)
        {
            if(is_array($param['method']))
            {
                foreach($param['method'] as $method)
                {
                    if(is_array($method))
                    {
                        foreach($method as $name => $arguments)
                        {
                            $this->_method = Method::make($name);

                            foreach($arguments as $kind => $argument)
                            {
                                $this->_method->addArgument(Argument::make($kind, $argument));
                            }
                        }

                        $this->_class->addMethod($this->_method);
                    }
                    elseif(is_string($method))
                    {
                        $this->_class->addMethod(Method::make($method));
                    }
                }
            }
            elseif(is_string($param['method']))
            {
                $this->_class->addMethod(Method::make($param['method']));
            }
        }

        $file = File::make(ucfirst($class).'php')->setStructure($this->_class);

        // Generate the code and display in the console
        $prettyPrinter = Build::prettyPrinter();
        echo '<pre>'.htmlspecialchars($prettyPrinter->generateCode($file)).'</pre>';
    }

    /*public function generate($class, $properties = NULL, $methods = NULL)
    {
        // Describe the code you want to generate using "Models"
        $this->_class = Object::make(ucfirst($class));

        if($properties !== NULL)
        {
            if(is_array($properties))
            {
                foreach($properties as $property)
                {
                    $this->_class->addProperty(Property::make($property));
                }
            }
            elseif(is_string($properties))
            {
                $this->_class->addProperty(Property::make($properties));
            }
        }

        if($methods !== NULL)
        {
            if(is_array($methods))
            {
                foreach($methods as $method)
                {
                    if(is_array($method))
                    {
                        foreach($method as $name => $arguments)
                        {
                            $this->_method = Method::make($name);

                            foreach($arguments as $kind => $argument)
                            {
                                $this->_method->addArgument(Argument::make($kind, $argument));
                            }
                        }

                        $this->_class->addMethod($this->_method);
                    }
                    elseif(is_string($method))
                    {
                        $this->_class->addMethod(Method::make($method));
                    }
                }
            }
            elseif(is_string($methods))
            {
                $this->_class->addMethod(Method::make($methods));
            }
        }

        $file = File::make(ucfirst($class).'php')->setStructure($this->_class);

        // Generate the code and display in the console
        $prettyPrinter = Build::prettyPrinter();
        echo '<pre>'.htmlspecialchars($prettyPrinter->generateCode($file)).'</pre>';
    }*/
}

// end of file