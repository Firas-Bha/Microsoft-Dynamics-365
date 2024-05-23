pageextension 50122 RHMenu extends "Business Manager Role Center"
{
    actions
    {
        addlast(Sections)
        {
            group("Purchase Order ")
            {
                Caption = 'Purchase Order';

                action("Tests")
                {
                    Caption = 'Tests';
                    RunObject = page "Tests Setup";
                    Image = Purchase;
                    ApplicationArea = All;
                }

                action(TestInstruments)
                {
                    ApplicationArea = All;
                    Caption = 'Test Instruments';
                    RunObject = page "TestInstumentSetup";

                }
                action("Test Variables")
                {
                    Caption = 'Test Variables';
                    RunObject = page "TestVariableNewLineCreation";
                    Image = Purchase;
                    ApplicationArea = All;

                }
                  action("PageOutcomeAddition")
                {
                    Caption = 'Variable Outcomes';
                    ApplicationArea = All;
                    RunObject = page "PageOutcomeAddition";
                }
                action("Test Groups")
                {
                    Caption = 'Test Groups';
                    RunObject = page "TestGroupPageList";
                    ApplicationArea = All;
                }
                action("Quality Groups")
                {

                    Caption = 'Quality Groups';
                    RunObject = page "QualityGroupCreationList";
                    ApplicationArea = All;
                }
                action("Item Quality Group")
                {

                    Caption = 'Item Quality Group';
                    RunObject = page "ItemQualityGroupList";
                    ApplicationArea = All;
                }

                  action("Item Sampling List View")
                {
                    Caption = 'Item Sampling List';
                    ApplicationArea = All;
                    RunObject = page "Item Sampling List View";
                }
                  action("WorkerResponsiblePage")
                {
                    Caption = 'Worker Responsible';
                    ApplicationArea = All;
                    RunObject = page "WorkerResponsiblePage";
                }
               

            }
            group("Check Quality Order")
            {
                Caption = 'Check Quality Order';

                action("Quality Order")
                {
                    ApplicationArea = All;
                    RunObject = page "CheckQualityPageList";
                }

                action("Check Quality Results")
                {
                    ApplicationArea = All;
                    RunObject = page "QualityResultsList";
                }

                action("CertificateOfAnalysisList ")
                {
                    Caption = 'Certificate Of Analysis';
                    ApplicationArea = All;
                    RunObject = page "CertificateOfAnalysisList";
                }
                 action("QualityOrderLineResultsTable ")
                {
                    Caption = 'Quality Order Line Results';
                    ApplicationArea = All;
                    RunObject = page "QualityOrderLineResults";
                }

               
                    


            }
        }

        addafter("Purchase Quotes")
        {
            action("Demandes d’achat")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Demandes d’achat';
                RunObject = page "TestGroupCreationPage";
            }
        }
    }
}
