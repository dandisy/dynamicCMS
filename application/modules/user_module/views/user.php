<htm>
    <body>
        <ul>
            <?php foreach ($user as $key=>$value) { ?>
                <li><?php echo $value->getName(); ?></li>
            <?php } ?>
        </ul>
    </body>
</htm>