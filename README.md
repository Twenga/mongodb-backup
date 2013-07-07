# MongoDB Backup -- version 0.1

Shell script to backup MongoDB databases.
Use mongodump command to make a hot backup of your environment.

Initialy is designed to backup sharded infrastructure on replicat set environment. I hope, as soon as possible, add new features to make this tools versatile 

## Functionnality

   * Stop Balancer (to prevent chunks migration during backup)
   * Compression
      * perform gzip compression
      * choose compression level (fast, normal, best)
   * Logging
      * Logging events to log file
   * Email reporting
   * Backup retention
 

## Setup

Clone the repository and move **stopBalancer.js** file on /usr/local/lib and **mongodb-backup** file /usr/local/bin.
This is the default config but you can keep the files on the same folder and where you want. Just define **STOP_BALANCER_JS** parameter in mongodb-backup

## Paramaters

Look parameters at the beginning of **mongodb-backup**. Set variables as you need. See comments.

## Usage

<pre>
   /path/of/mongodb-backup
</pre>

## Running process description

   * Check if mongodb-backup is already running
   * Get parameters to prepare backup
   * Stop balancer
   * Dump config database
   * Dump databases one each shard. Pickup a slave if the shard host you specified is master
   * Start balancer
   * Compress dumped directories
   * Check backup retention
   * Send a backup report by mail


