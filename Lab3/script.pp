## Ehsan Karimi
## This is the puppet manifest for Lab 3.


define macro-useradd ($password, $uid, $gid, $groups) {

    $username = $title

    user { "$username":
        name        => "$username",
        home        => "/home/$username",
        shell       => "/bin/bash",
        uid         => $uid,
        gid         => $gid,
        managehome  => "true",
        membership     => "inclusive",
        password    => "$password",
        groups      => ["$groups", "$username"],
    }
    file { "/home/${username}":
        ensure      => "directory",
        owner       => "$username",
        group       => ["$username"]
    }

    group { "$username":
        gid => $uid,
    }
}

group { "managers":
    ensure => "present",
    gid    => "5001"
}

file { '/home/managers':
    ensure  => "directory",
    owner   => "mscott",
    group   => 'managers',
    mode    => '2770',
}

group { "sales":
    ensure => "present",
    gid    => "5002"
}

file { '/home/sales':
    ensure  => "directory",
    owner   => "abernard",
    group   => 'sales',
    mode    => '2770',
}

group { "accounting":
    ensure => "present",
    gid    => "5003"
}

file { '/home/accounting':
    ensure  => "directory",
    owner   => "amartin",
    group   => 'accounting',
    mode    => '2770',
}

class user-mscott {
    macro-useradd { "mscott":
    password        => '$1$fna5uoZJ$22.kjcZXV1.8vIgvTxdv51',
        uid         => 3000,
        gid         => 3000,
        groups      => ["managers"],
    }
}
class { 'user-mscott': }

class user-dschrute {
    macro-useradd { "dschrute":
    password    => '$1$fna5uoZJ$22.kjcZXV1.8vIgvTxdv51',
    uid         => 3001,
    gid         => 3001,
    groups      => ['managers'],
    }
}
class {'user-dschrute':}

class user-jhalpert {
    macro-useradd { "jhalpert":
    password    => '$1$fna5uoZJ$22.kjcZXV1.8vIgvTxdv51',
    uid         => 3002,
    gid         => 3002,
    groups      => ['managers'],
    }
}
class {'user-jhalpert':}

class user-pbeesly {
    macro-useradd { "pbeesly":
    password    => '$1$fna5uoZJ$22.kjcZXV1.8vIgvTxdv51',
    uid         => 3003,
    gid         => 3003,
    groups      => ['pbeesly'],
    }
}
class {'user-pbeesly':}

class user-abernard {
    macro-useradd { "abernard":
    password    => '$1$fna5uoZJ$22.kjcZXV1.8vIgvTxdv51',
    uid         => 3004,
    gid         => 3004,
    groups      => ['sales'],
    }
}
class {'user-abernard':}

class user-amartin {
    macro-useradd { "amartin":
    password    => '$1$fna5uoZJ$22.kjcZXV1.8vIgvTxdv51',
    uid         => 3005,
    gid         => 3005,
    groups      => ['accounting'],
    }
}
class {'user-amartin':}

class user-kkapoor {
    macro-useradd { "kkapoor":
    password    => '$1$fna5uoZJ$22.kjcZXV1.8vIgvTxdv51',
    uid         => 3006,
    gid         => 3006,
    groups      => ['kkapoor'],
    }
}
class {'user-kkapoor':}

class user-omartinez {
    macro-useradd { "omartinez":
    password    => '$1$fna5uoZJ$22.kjcZXV1.8vIgvTxdv51',
    uid         => 3007,
    gid         => 3007,
    groups      => ['accounting'],
    }
}
class {'user-omartinez':}

class user-dphilbin {
    macro-useradd { "dphilbin":
    password    => '$1$fna5uoZJ$22.kjcZXV1.8vIgvTxdv51',
    uid         => 3008,
    gid         => 3008,
    groups      => ['dphilbin'],
    }
}
class {'user-dphilbin':}

class user-tflenderson {
    macro-useradd { "tflenderson":
    password    => '$1$fna5uoZJ$22.kjcZXV1.8vIgvTxdv51',
    uid         => 3009,
    gid         => 3009,
    groups      => ['tflenderson'],
    }
}
class {'user-tflenderson':}

class user-kmalone {
    macro-useradd { "kmalone":
    password    => '$1$fna5uoZJ$22.kjcZXV1.8vIgvTxdv51',
    uid         => 3010,
    gid         => 3010,
    groups      => ['accounting'],
    }
}
class {'user-kmalone':}

class user-plapin {
    macro-useradd { "plapin":
    password    => '$1$fna5uoZJ$22.kjcZXV1.8vIgvTxdv51',
    uid         => 3011,
    gid         => 3011,
    groups      => ['sales'],
    }
}
class {'user-plapin':}

class user-shudson {
    macro-useradd { "shudson":
    password    => '$1$fna5uoZJ$22.kjcZXV1.8vIgvTxdv51',
    uid         => 3012,
    gid         => 3012,
    groups      => ['sales'],
    }
}
class {'user-shudson':}

class user-mpalmer {
    macro-useradd { "mpalmer":
    password    => '$1$fna5uoZJ$22.kjcZXV1.8vIgvTxdv51',
    uid         => 3013,
    gid         => 3013,
    groups      => ['mpalmer'],
    }
}
class {'user-mpalmer':}

class user-cbratton {
    macro-useradd { "cbratton":
    password    => '$1$fna5uoZJ$22.kjcZXV1.8vIgvTxdv51',
    uid         => 3014,
    gid         => 3014,
    groups      => ['cbratton'],
    }
}
class {'user-cbratton':}

group { "ekarimi":
    ensure => "present",
    gid    => "500"
}

user { "ekarimi":
    name        => "ekarimi",
    home        => "/home/ekarimi",
    shell       => "/bin/bash",
    uid         => 500,
    gid         => 500,
    managehome  => "true",
    password    => '$1$fna5uoZJ$22.kjcZXV1.8vIgvTxdv51',
    groups      => ["sales", "accounting", "managers", "ekarimi"],
}
file { "/home/ekarimi":
    ensure      => "directory",
    owner       => "ekarimi",
}
