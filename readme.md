# aliClicker

## Phase 1

### Itération 1.1 : Installation et Configuration Initiale

Back-end (Symfony)

Installation de Symfony :

Utilisez Composer pour installer Symfony : composer create-project symfony/skeleton aliClicker.
Familiarisez-vous avec la structure du projet et les fichiers générés.
Configuration de l'Environnement :

Modifiez le fichier .env pour définir les paramètres de votre environnement, notamment la base de données.
Installez les dépendances essentielles : composer require symfony/orm-pack pour Doctrine et composer require symfony/security-bundle pour la sécurité.
Configuration de Doctrine :

Configurez Doctrine pour se connecter à votre base de données MySQL en modifiant le fichier .env.
Testez la connexion à la base de données en exécutant : php bin/console doctrine:database:create.
Front-end (Vue.js & TypeScript)
Installation de Vue.js :

Utilisez Vue CLI pour créer un nouveau projet : vue create aliClicker-front.
Lors de la configuration, choisissez d'inclure TypeScript.
Configuration de TypeScript :

Familiarisez-vous avec le fichier tsconfig.json et assurez-vous qu'il est correctement configuré pour votre projet.
Créez quelques composants simples pour tester TypeScript avec Vue.js.
Installation des Packages Essentiels :

Installez Vuex pour la gestion de l'état : npm install vuex.
Installez Vue Router pour la navigation : npm install vue-router.
Installez Axios pour la communication HTTP : npm install axios.
