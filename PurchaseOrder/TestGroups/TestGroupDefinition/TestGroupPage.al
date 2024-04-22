page 50145 TestGroupPage
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = TestGroupTable;

    layout
    {
        area(Content)
        {
            group(TestGroupSetup)
            {
                Caption = 'Test Group Setup';
                field(TestGroup; rec.TestGroup)
                {
                    Caption = 'Test Group';
                    //Editable = false;
                    ApplicationArea = All;

                }
                field(Description; rec.Description)
                {
                    //Editable = false;
                    ApplicationArea = All;

                }
                field(AcceptableQualityLevel; rec.AcceptableQualityLevel)
                {
                    //Editable = false;
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
                    //Editable = false;
                    Caption = 'Item Sampling';
                    ApplicationArea = All;

                }
                field(Destructive; rec.Destructive)
                {
                    //Editable = false;
                    ApplicationArea = All;

                }



            }
            group(TestGroupCreation)
            {
                Caption = 'Test Group Records';
                part(TestPage; TestGroupCreationPage)
                {
                    Caption = 'Export Excel';
                    ApplicationArea = All;
                    SubPageLink = "TestGroup" = field("TestGroup");
                    UpdatePropagation = Both;

                }
            }


        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin

                end;
            }
        }
    }


}