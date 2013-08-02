# MongoDB Backup -- version 0.2

Shell script to backup MongoDB databases.
Use mongodump command to make a hot backup of your environment.

Initially, it was designed to backup all databases on replicatSet and sharded environment. I hope to add, as soon as possible, new features in order to make these tools versatile 

## Functionnality

   * Stop Balancer (to prevent chunks migration during backup)
   * Compression
      * perform gzip compression
      * choose compression level (fast, normal, best)
   * Logging
      * Logging events to log file
      * Display events to stdout
   * Email reporting
   * Backup retention

## Requirements

  - MongoDB client 2.2 or above 
  - Tested operating systems: Debian/Ubuntu Linux

## Setup

Clone the repository and run the **install.sh** script
```bash
$ git clone https://github.com/Twenga/mongodb-backup.git
$ cd mongodb-backup
$ ./install.sh
```

## Default paramaters

Look the options in **/etc/mongodb-backup.conf** file. Set variables as you need especially the shard options. See comments.

## Usage

```bash
Usage: mongodb-backup [options] ...

Options are...
   -h 	 Display this help message
   -j 	 Enable dump jounalisation
   -e 	 Display events to STDOUT
   -m <mail_address> 	 Set email reporting address
   -c <compress_level>	 Override compression level: normal, fast or best (default: normal)
   -u <username>
   -p <password>
```

Run mongodb-backup without options to do a backup with default parameters (see /etc/mongodb-backup.conf). If you don't set shard parameters it will backup config server only.

## Running process description

   * Check if mongodb-backup is already running
   * Get parameters to prepare backup
   * Stop balancer
   * Dump config database
   * Dump databases -> one per shard. Pickup a slave if the shard host you specified is master
   * Start balancer
   * Compress dumped directories
   * Check backup retention
   * Send a backup report by mail (if it set)

## Copyrights & licensing
Licensed under the Apache License 2.0.
See [LICENSE](LICENSE.md) file for details.

## ChangeLog
See [CHANGELOG](CHANGELOG.md) file for details.
