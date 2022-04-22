# Defacto2 legacy website - 2010, March 10.

![GitHub](https://img.shields.io/github/license/Defacto2/defacto2-v4?style=flat-square)
![Maintenance](https://img.shields.io/maintenance/no/2010?style=flat-square)
&nbsp;
![GitHub repo size](https://img.shields.io/github/repo-size/Defacto2/defacto2-v4?style=flat-square)

The redundant source code of the Defacto2 web application referred to as _Version 4_. Created in 2003 but various parts of the code were amended and modified multiple times over the years until retirement in mid-2010. As such it is a bit of a hack job, messy and poorly documented.

The code itself requires **Adobe ColdFusion 8** * or higher, **Microsoft IIS 6** and the SQL database needs 
[MySQL 4.1 or 5](http://downloads.mysql.com/archives/community/).

Adobe ColdFusion 8 is no longer offered for download but it may work with the open sourced [Lucee](http://lucee.org/).

The *web application* expects to be hosted in the local directory of `c:/websites/urk7tb/`

The MySQL data source is expected to be named `defacto2net`

Most of the *web application's* settings can be found in `Application.cfc` or the sub-directory `/CFC`

The recommended IDE to view this code is [Eclipse](https://eclipse.org/) combined with [CFEclipse](http://cfeclipse.org/) or [Sublime Text](https://www.sublimetext.com/) with the [ColdFusion Sublime Text Package](https://github.com/SublimeText/ColdFusion).

The required MySQL database tables are on [GitHub](https://github.com/Defacto2/defacto2-version4-mysql-databases).
