# Chrony Time Server Container

This container is running time server Chrony on Alpine Linux to serve a time service inside of your network without needing permissions on the host.

## :rocket: Deployment

I added a Kubernetes deployment file to deploy the container to a Kubernetes cluster. You can find the file in the `kubernetes` folder.
The deployment.yaml file is just an example and uses Traefik as a reverse proxy. You can and probably have to change the deployment file to your needs.

---

## :ambulance: Support Information

For further information about this project, how to [contribute](docs/CONTRIBUTING.md), or how to get in touch, please have a look at the [support document](docs/SUPPORT.md) of this repository. The repository also contains information about [security related topics](docs/SECURITY.md), [licensing](LICENSE), and more.

## :man_judge: Disclaimer

THE CONTENT OF THIS REPOSITORY IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE CONTENT OF THIS REPOSITORY OR THE USE OR OTHER DEALINGS IN THE REPOSITORY.
