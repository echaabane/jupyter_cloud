But du dossier<br>
créer un environnement avec jupyter lab dans GCP.<br>
<br>
prerequis :<br>
<ul>
    <li>Avoir installer terraform</li>
    <li>Avoir créer un projet sur gcp</li>
    <li>Créer un compte de service pour terraform et avoir telecharger les incremential en json</li>
    <li>Option : crée un compte utilisateur puis l'ajouter dans le main.tf</li>
</ul>
<br>
Pour lancer l application : <br>

créer un fichier de configuration variables.tfvars<br>

```bash
region                      = "region_voulue" 
zone                        = "zone_voulue"
project                     = "nom_du_projet"
credentials                 = "emplacement_du_fichier_json_contenant_les_incrementials"
```

Modifier le fichier main.tf à votre goût:<br>
<ul>
    <li>VM : changer de machine ajouter un GPU</li>
    <li>activer la crypto des disques</li>
    <li>Activé ou non le proxy</li>
    <li>Mettre un utilisateur particulier pour l'instance.</li>
</ul>

Ensuite executer dans un terminal :<br>

```bash
terraform init
terraform validate
terraform plan -var-file=variables.tfvars  
terraform apply -var-file=variables.tfvars
```
Pour detruire le notebook, éxécuter dans un terminal:<br>

```bash
terraform destroy -var-file=variables.tfvars
```