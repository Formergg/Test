<?php

// autoload_static.php @generated by Composer

namespace Composer\Autoload;

class ComposerStaticInit775aaf5c7f3a2bca485f465ebe3fe8d5
{
    public static $classMap = array (
        'Composer\\InstalledVersions' => __DIR__ . '/..' . '/composer/InstalledVersions.php',
    );

    public static function getInitializer(ClassLoader $loader)
    {
        return \Closure::bind(function () use ($loader) {
            $loader->classMap = ComposerStaticInit775aaf5c7f3a2bca485f465ebe3fe8d5::$classMap;

        }, null, ClassLoader::class);
    }
}
