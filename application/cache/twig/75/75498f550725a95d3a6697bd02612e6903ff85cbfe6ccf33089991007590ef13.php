<?php

/* welcome.twig */
class __TwigTemplate_39bce802c3290b026d0d0e0621d3bbb5bfa62f1281393ad7d167bba4e3c72ae7 extends Twig_Template
{
    public function __construct(Twig_Environment $env)
    {
        parent::__construct($env);

        $this->parent = false;

        $this->blocks = array(
        );
    }

    protected function doDisplay(array $context, array $blocks = array())
    {
        // line 1
        echo "<h1>";
        echo twig_escape_filter($this->env, (isset($context["nama"]) ? $context["nama"] : null), "html", null, true);
        echo "</h1>";
    }

    public function getTemplateName()
    {
        return "welcome.twig";
    }

    public function isTraitable()
    {
        return false;
    }

    public function getDebugInfo()
    {
        return array (  19 => 1,);
    }
}
/* <h1>{{ nama }}</h1>*/
