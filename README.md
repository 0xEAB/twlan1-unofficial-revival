# TWLan 1: The Unofficial Revival

*Unofficial* setup script and helpers for installing and setting up the good old TWLan v1.
Please note that this is an unofficial project not supported by the developers of the TWLan.


## Usage

1. Prerequisites
    1. Read the SECURITY WARNING below.
    2. Read the bundled LICENSE files. In order to use *TWLan 1* you must accept those licenses.
    3. Make sure you have a C/C++ compiler, `make` and all required libraries/headers installed.
    4. Don't ask here what libs you'll need. Check the manuals of the respective programs (...or just start and read the error log to find out what's missing then).
    5. Also you'll sure you have the following utils installed: Bash, cURL, patch, tar

2. TWLan v1 installation + compatible PHP
    1. Create a setup config file: `cp config.example config`.
    2. In order to customize the installation edit the `config` file.
    3. Start the installation process with `./setup.sh`.

3. Server setup
    1. There's no need to stick to legacy stuff here - the latest versions are perfectly fine. Just install those server apps the "usual way". If you have already such ones installed, use them.
    2. Install a FastCGI-compatible webserver (e.g. lighttpd, nginx, OpenLiteSpeed, Apache). Let it serve the TWLan content folder and configure PHP4 as script handler.
    3. Install MySQL/MariaDB. Add a new user and import `dslan.sql` from your Revival installation. (In order to allow PHP4 to connect you might need some tricks like `OLD_PASSWORD()`. (If you're living on the edge, you could also just create a local-only user with no password.))
    4. Configure your TWLan installation (esp. database connection), see `include/config.php`.

## About TWLan

<img src="https://twlan.org/img/logo.png" alt="TWLan logo"/>

**TWLan** (aka **DSLan**) is a rebuild of the [Tribal Wars browser game](https://www.tribalwars.net/), which lets you set up and play on your own local server.

It is proprietary software licensed under the terms specified in the [General Terms and Conditions](LICENSE.DSLan.de.txt) ([🇬🇧 translation](LICENSE.DSLan.en.txt)) it ships with plus those in the [Rechtliche Hinweise](https://twlan.org/showthread.php?tid=763) thread.

Thanks to [InnoGames](https://www.innogames.com/) for their great browser game.


## SECURITY WARNING

TWLan v1 (the fan-made LAN version -- not to be confused with the original 'Tribal Wars' online browsergame by InnoGames!) is legacy software depending on a bunch of other outdated software.
Both TWLan and its dependencies may have several security vulnerabilities, thus it should be run it trusted environments only.
Running it publicly accessible, which is forbidden by the license of DSLan anyway, can result in your machine getting compromised.
To sum up, running TWLan v1 is potentially dangerous and should essentially not be done at all.


The scripts in this package can be used to download, build and setup such outdated software and are intended for experimental purposes only.
You may use them at your own risk. But, you have been warned.

```
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE, TITLE AND NON-INFRINGEMENT. IN NO EVENT
SHALL THE COPYRIGHT HOLDERS OR ANYONE DISTRIBUTING THE SOFTWARE BE LIABLE
FOR ANY DAMAGES OR OTHER LIABILITY, WHETHER IN CONTRACT, TORT OR OTHERWISE,
ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
DEALINGS IN THE SOFTWARE.
```


## Usage

This scripts are meant to be used on UNIX-like systems along with GNU Bash.

For Windows please refer to the [official DSLan v1.4](https://twlan.org/showthread.php?tid=43401&pid=193753#pid193753) package.
