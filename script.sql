/*==============================================================*/
/* Nom de SGBD :  MySQL 5.0                                     */
/* Date de création :  28/07/2023 12:07:17                      */
/*==============================================================*/


drop table if exists directeur_memoire;

drop table if exists enseignant;

drop table if exists etudiant;

drop table if exists facture;

drop table if exists maitre_stage;

drop table if exists memoire_rapport_stage;

drop table if exists notification;

drop table if exists payement;

drop table if exists president_jury;

drop table if exists role;

drop table if exists salle_soutenance;

drop table if exists soutenance;

drop table if exists utilisateurs;

/*==============================================================*/
/* Table : directeur_memoire                                    */
/*==============================================================*/
create table directeur_memoire
(
   id_dm                int,
   nom                  varchar(254),
   prenom               varchar(254),
   email                varchar(254),
   telephone            int
);

/*==============================================================*/
/* Table : enseignant                                           */
/*==============================================================*/
create table enseignant
(
   id_enseignant        int not null,
   nom                  varchar(254),
   prenom               varchar(254),
   mail                 varchar(254),
   telephone            int,
   primary key (id_enseignant)
);

/*==============================================================*/
/* Table : etudiant                                             */
/*==============================================================*/
create table etudiant
(
   id_etudiant          int not null,
   nom                  varchar(254),
   prenom               varchar(254),
   matricule            varchar(254),
   filiere              varchar(254),
   email                varchar(254),
   telephone            int,
   primary key (id_etudiant)
);

/*==============================================================*/
/* Table : facture                                              */
/*==============================================================*/
create table facture
(
   id_facture           int not null,
   id_payement          int not null,
   description          int,
   primary key (id_facture)
);

/*==============================================================*/
/* Table : maitre_stage                                         */
/*==============================================================*/
create table maitre_stage
(
   id_maitre            int not null,
   id_memoire_rs        int not null,
   id_soutenance        int not null,
   nom                  varchar(254),
   prenom               varchar(254),
   email                varchar(254),
   telephone            int,
   primary key (id_maitre)
);

/*==============================================================*/
/* Table : memoire_rapport_stage                                */
/*==============================================================*/
create table memoire_rapport_stage
(
   id_memoire_rs        int not null,
   nom                  varchar(254),
   primary key (id_memoire_rs)
);

/*==============================================================*/
/* Table : notification                                         */
/*==============================================================*/
create table notification
(
   id_notification      int not null,
   id_presidentj        int not null,
   primary key (id_notification)
);

/*==============================================================*/
/* Table : payement                                             */
/*==============================================================*/
create table payement
(
   id_payement          int not null,
   description          varchar(254),
   date_payement        datetime,
   primary key (id_payement)
);

/*==============================================================*/
/* Table : president_jury                                       */
/*==============================================================*/
create table president_jury
(
   id_presidentj        int not null,
   id_soutenance        int not null,
   nom                  varchar(254),
   prenom               varchar(254),
   titre                varchar(254),
   filiere              varchar(254),
   primary key (id_presidentj)
);

/*==============================================================*/
/* Table : role                                                 */
/*==============================================================*/
create table role
(
   id_role              int not null,
   libelle              varchar(254),
   primary key (id_role)
);

/*==============================================================*/
/* Table : salle_soutenance                                     */
/*==============================================================*/
create table salle_soutenance
(
   id_salle             int not null,
   nom_salle            varchar(254),
   primary key (id_salle)
);

/*==============================================================*/
/* Table : soutenance                                           */
/*==============================================================*/
create table soutenance
(
   id_soutenance        int not null,
   date_                datetime,
   lieu                 varchar(254),
   heure                varchar(254),
   resultat             varchar(254),
   decision             varchar(254),
   mention              varchar(254),
   primary key (id_soutenance)
);

/*==============================================================*/
/* Table : utilisateurs                                         */
/*==============================================================*/
create table utilisateurs
(
   id_utilisateur       int not null,
   id_role              int not null,
   nom                  varchar(254),
   identifiant          varchar(254),
   mot_de_passe         varchar(254),
   telephone            int,
   primary key (id_utilisateur)
);

alter table facture add constraint FK_Association_12 foreign key (id_payement)
      references payement (id_payement) on delete restrict on update restrict;

alter table maitre_stage add constraint FK_Association_15 foreign key (id_soutenance)
      references soutenance (id_soutenance) on delete restrict on update restrict;

alter table maitre_stage add constraint FK_Association_17 foreign key (id_memoire_rs)
      references memoire_rapport_stage (id_memoire_rs) on delete restrict on update restrict;

alter table notification add constraint FK_Association_21 foreign key (id_presidentj)
      references president_jury (id_presidentj) on delete restrict on update restrict;

alter table president_jury add constraint FK_Association_7 foreign key (id_soutenance)
      references soutenance (id_soutenance) on delete restrict on update restrict;

alter table utilisateurs add constraint FK_Association_11 foreign key (id_role)
      references role (id_role) on delete restrict on update restrict;

