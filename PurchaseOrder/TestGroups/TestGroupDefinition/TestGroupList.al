page 50142 TestGroupPageList
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = TestGroupTable;
    CardPageId = "TestGroupPage";

    Caption = 'Test Groups';

    layout
    {
        area(Content)
        {
            group(Create)
            {
                Caption = 'Test Groups';
                repeater(TestGroupSetup)
                {
                    field(TestGroup; rec.TestGroup)
                    {
                        Caption = 'Test Group';
                        ApplicationArea = All;


                    }
                    field(Description; rec.Description)
                    {
                        ApplicationArea = All;

                    }
                    field(AcceptableQualityLevel; rec.AcceptableQualityLevel)
                    {
                        Caption = 'Acceptable Quality Level';
                        ApplicationArea = All;
                        trigger OnValidate()
                        var
                            myInt: Integer;
                        begin

                            if (rec.AcceptableQualityLevel > 100) then begin
                                Message('Current Value is Above 100% and cannot be Accepted');
                            end

                            else
                                if (rec.AcceptableQualityLevel < 0) then begin
                                    Message('Current Value is under 0% and cannot be Accepted');
                                end;

                        end;

                    }
                    field(ItemSampling; rec.ItemSampling)
                    {
                        Caption = 'Item Sampling';
                        ApplicationArea = All;
                        Visible = false;

                    }
                    field(Destructive; rec.Destructive)
                    {
                        ApplicationArea = All;

                    }
                


                }


            }

            group("All Test Records")
            {
                part(TestPage; TestGroupCreationList)
                {
                    Caption = 'List';
                    ApplicationArea = All;
                    // SubPageLink = "TestGroup" = field("TestGroup");
                    // UpdatePropagation = Both;

                }
            }

        }


        area(Factboxes)
        {
            part(ItemAttributesFactBox;TestGroupCreationList)
            {
                ApplicationArea = all;
                SubPageLink = "TestGroup" = field("TestGroup");
                UpdatePropagation = Both;

            }

            systempart(Links; Links)
            {
                ApplicationArea = All;
            }         
            systempart(Notes; Notes)
            {
                ApplicationArea = All;
            }       


        }
    }
    actions
    {

        area(Creation)
        {
            
            action(TestGroupCreation)
            {
                Caption = 'Test Group Creation';

                ApplicationArea = All;
                PromotedCategory = Category10;
                Promoted = true;
                PromotedIsBig = true;
                Image = ListPage;

                trigger OnAction();
                var
                    testgroup: Page "TestGroupCreationList";
                    Tests: Page "Tests Setup";
                begin
                    testgroup.run();
                end;
            }

            action(LinkToTests)
            {
                Caption = 'Test';
                ApplicationArea = All;
                Promoted = true;
                PromotedIsBig = true;
                PromotedCategory = Category10;
                image = Add;

                trigger OnAction()
                var
                    Tests: Page "Tests Setup";
                begin
                    Tests.Run();
                end;
            }

            action(LoadItemAttributesData)
            {
                Caption = 'Load Selected Item Attributes Data';
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                ShortCutKey = 'Shift+Ctrl+D';
                ApplicationArea = All;

                trigger OnAction()
                var
                    SalesLinesRec: Record "TestGroupTable";
                begin

                end;

            }

        }
    }
    /*
        trigger OnInsertRecord(qualityAccepted: Boolean): Boolean;
    begin
        // Initialize qualityAccepted variable to true
        qualityAccepted := true;

        // Calculate if the quality level is accepted
        qualityAccepted := CalculateQualityLevel();

        // If the quality level is not accepted, show an error and prevent insertion
        if not qualityAccepted then
        begin
            error('Quality Level not accepted. Insertion not allowed.');
            exit(false);
        end;

        SaveRecord();
    end;

    procedure CalculateQualityLevel(): Boolean;
    begin
        if rec.AcceptableQualityLevel < 100 then begin
            Message('Quality Level Not Accepted');
            exit(false);
        end;

        // Return true when quality level is accepted
        exit(true);
    end;

    */
/*
    trigger OnAfterGetCurrRecord()
    begin

        CurrPage.ItemAttributesFactBox.Page.TestGroupCreationList(rec.TestGroup);
    end;
    */
}


