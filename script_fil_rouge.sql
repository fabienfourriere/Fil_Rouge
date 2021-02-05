CREATE DATABASE fil_rouge;

USE fil_rouge;

CREATE TABLE categorie(
   id_cat INT,
   coef INT,
   id_ss_cat INT NOT NULL,
   PRIMARY KEY(id_cat),
   FOREIGN KEY(id_ss_cat) REFERENCES categorie(id_cat)
);

CREATE TABLE salarie(
   id_sal INT,
   nom_sal VARCHAR(50),
   reduction INT,
   poste_sal VARCHAR(50),
   PRIMARY KEY(id_sal)
);

CREATE TABLE fournisseur(
   id_fourni INT,
   nom_fourni VARCHAR(50),
   ville_fourni VARCHAR(50),
   pays_fourni VARCHAR(50),
   adresse_fourni VARCHAR(150),
   codep_fourni INT,
   contact_fourni INT(10),
   phone_fourni INT(10),
   mail_fourni VARCHAR(100),
   id_sal_fourni INT NOT NULL,
   PRIMARY KEY(id_fourni),
   FOREIGN KEY(id_sal_fourni) REFERENCES salarie(id_sal)
);

CREATE TABLE produit(
   id_pro INT,
   nom_pro VARCHAR(50),
   prix_pro INT,
   ean_pro INT(13),
   stock_phy INT,
   stock_ale INT,
   date_aj DATE,
   date_maj DATE,
   file VARCHAR(50),
   lib VARCHAR(50),
   descrip VARCHAR(200),
   id_fourni_pro INT NOT NULL,
   id_cat_pro INT NOT NULL,
   PRIMARY KEY(id_pro),
   FOREIGN KEY(id_fourni_pro) REFERENCES fournisseur(id_fourni),
   FOREIGN KEY(id_cat_pro) REFERENCES categorie(id_cat)
);

CREATE TABLE paiement(
   cat_cli VARCHAR(50),
   mode BOOLEAN,
   id_sal_pay INT NOT NULL,
   PRIMARY KEY(cat_cli),
   FOREIGN KEY(id_sal_pay) REFERENCES salarie(id_sal)
);

CREATE TABLE client(
   id_cli INT,
   adresse_cli VARCHAR(150),
   ref_cli INT,
   contact_cli INT(10),
   adresse_liv_cli VARCHAR(150),
   adresse_fac_cli VARCHAR(150),
   etat_cli BOOLEAN,
   cat_cli INT,
   coef_client INT,
   nom_cli VARCHAR(50),
   id_cli_1 INT NOT NULL,
   id_sal_cli INT NOT NULL,
   PRIMARY KEY(id_cli),
   FOREIGN KEY(id_cli_1) REFERENCES client(id_cli),
   FOREIGN KEY(id_sal_cli) REFERENCES salarie(id_sal)
);

CREATE TABLE commande(
   ref_commande INT,
   designation VARCHAR(50),
   prix_u_ht INT,
   qte INT,
   total_ht INT,
   tva INT,
   total_ttc INT,
   etat_commande BOOLEAN,
   adresse_fac VARCHAR(200),
   etat_livraison BOOLEAN,
   adresse_liv VARCHAR(200),
   id_cli_com INT NOT NULL,
   PRIMARY KEY(ref_commande),
   FOREIGN KEY(id_cli_com) REFERENCES client(id_cli)
);

CREATE TABLE ligne_commande(
   ref_li_commande INT,
   prix_uni INT,
   qte INT,
   reduc INT,
   id_pro_lig INT NOT NULL,
   ref_commande_lig INT NOT NULL,
   PRIMARY KEY(ref_li_commande),
   FOREIGN KEY(id_pro_lig) REFERENCES produit(id_pro),
   FOREIGN KEY(ref_commande_lig) REFERENCES commande(ref_commande)
);
