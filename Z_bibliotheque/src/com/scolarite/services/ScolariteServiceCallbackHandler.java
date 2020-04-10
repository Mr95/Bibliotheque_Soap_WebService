
/**
 * ScolariteServiceCallbackHandler.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis2 version: 1.6.4  Built on : Dec 28, 2015 (10:03:39 GMT)
 */

    package com.scolarite.services;

    /**
     *  ScolariteServiceCallbackHandler Callback class, Users can extend this class and implement
     *  their own receiveResult and receiveError methods.
     */
    public abstract class ScolariteServiceCallbackHandler{



    protected Object clientData;

    /**
    * User can pass in any object that needs to be accessed once the NonBlocking
    * Web service call is finished and appropriate method of this CallBack is called.
    * @param clientData Object mechanism by which the user can pass in user data
    * that will be avilable at the time this callback is called.
    */
    public ScolariteServiceCallbackHandler(Object clientData){
        this.clientData = clientData;
    }

    /**
    * Please use this constructor if you don't want to set any clientData
    */
    public ScolariteServiceCallbackHandler(){
        this.clientData = null;
    }

    /**
     * Get the client data
     */

     public Object getClientData() {
        return clientData;
     }

        
           /**
            * auto generated Axis2 call back method for info method
            * override this method for handling normal response from info operation
            */
           public void receiveResultinfo(
                    com.scolarite.services.ScolariteServiceStub.InfoResponse result
                        ) {
           }

          /**
           * auto generated Axis2 Error handler
           * override this method for handling error response from info operation
           */
            public void receiveErrorinfo(java.lang.Exception e) {
            }
                
           /**
            * auto generated Axis2 call back method for liste_Fin_Etude method
            * override this method for handling normal response from liste_Fin_Etude operation
            */
           public void receiveResultliste_Fin_Etude(
                    com.scolarite.services.ScolariteServiceStub.Liste_Fin_EtudeResponse result
                        ) {
           }

          /**
           * auto generated Axis2 Error handler
           * override this method for handling error response from liste_Fin_Etude operation
           */
            public void receiveErrorliste_Fin_Etude(java.lang.Exception e) {
            }
                
           /**
            * auto generated Axis2 call back method for est_inscrit method
            * override this method for handling normal response from est_inscrit operation
            */
           public void receiveResultest_inscrit(
                    com.scolarite.services.ScolariteServiceStub.Est_inscritResponse result
                        ) {
           }

          /**
           * auto generated Axis2 Error handler
           * override this method for handling error response from est_inscrit operation
           */
            public void receiveErrorest_inscrit(java.lang.Exception e) {
            }
                
           /**
            * auto generated Axis2 call back method for liste_Bloques method
            * override this method for handling normal response from liste_Bloques operation
            */
           public void receiveResultliste_Bloques(
                    com.scolarite.services.ScolariteServiceStub.Liste_BloquesResponse result
                        ) {
           }

          /**
           * auto generated Axis2 Error handler
           * override this method for handling error response from liste_Bloques operation
           */
            public void receiveErrorliste_Bloques(java.lang.Exception e) {
            }
                


    }
    