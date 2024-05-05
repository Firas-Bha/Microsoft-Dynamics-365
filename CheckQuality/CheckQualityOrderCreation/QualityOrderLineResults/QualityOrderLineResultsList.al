
page 50129 QualityOrderLineResults
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = QualityOrderLineResultsTable;

    layout
    {
        area(Content)
        {
            repeater(QualityOrderLineResults)
            {

                /*
                    field(No; rec.no)
                    {
                        ApplicationArea = All;
                        Editable = true;
                    }
                    */

                field(QualityOrder; rec.QualityOrder)
                {

                    ApplicationArea = All;
                }

                field(Outcome; rec.Outcome)
                {
                    ApplicationArea = All;
                    trigger OnValidate()
                    var
                        MyRecord2 : Record "TestVariableOutcomesTable";
                    begin
                        if MyRecord2.Get(rec.Outcome) then begin
                            if rec.Outcome = 'ACCEPTED' then begin
                                rec.Test:=true;
                            end
                            else
                            rec.test :=false;                            
                        end;
                        
                    end;

                }
                field(ResultsQuantity; rec.ResultsQuantity)
                {
                ApplicationArea = All;

                trigger OnValidate()
                var
                  MyRecord1: Record "CheckQualityOrderTable";
                  MyRecord2 : Record "ItemSamlingsTable";
                  MyRecord3: Record "QualityOrderLineResultsTable";
                begin
                    
                    if MyRecord1.Get(rec.QualityOrder) then   
                                       
                      //  Message('Total quantity is %1 and quantity is %2', rec."Total Quantity",MyRecord1.Quantityy);    
                        begin
                         rec.SumQuantity:=rec."Total Quantity" + rec.ResultsQuantity;   
                        if (rec.SumQuantity > MyRecord1.Quantityy) then 
                 begin
                // Display message with quantity details
               // Message('Total quantity is %1 and quantity is %2', rec."Total Quantity",MyRecord2.Value);
                // Display message and raise error
                Message('Quantity Surpassed');
                Error('Quantity Surpassed');
                 end
                         end
                    end;
                    
                         
        
    
}




                field(IncludeInResult; rec.IncludeInResult)
                {
                    ApplicationArea = All;

                }
                field(Test; rec.Test)
                {
                    ApplicationArea = All;

                }
                field("Total Quantity"; rec."Total Quantity")
                {

                }
                 field("sum Quantity"; rec."SumQuantity")
                {
                    Editable=false;
                }
            }
        }
        area(Factboxes)
        {

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

    trigger OnNewRecord(BelowxRec: Boolean)
    var
        totalQuantity: Decimal;
        MyRecord2: Record "QualityOrderLineResultsTable";
    begin
        BelowxRec := false;
         totalQuantity:= MyRecord2."Total Quantity";
        //rec.SumQuantity := totalQuantity;
        BelowxRec := true;
    end;

/*
    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    var
        MyRecord3: Record "TestVariableOutcomesTable";
        MyRecord2: Record "QualityOrderLineResultsTable";
    begin
        BelowxRec := false;
                rec.SumQuantity := rec."Total Quantity";
                BelowxRec :=true;
        
        exit(BelowxRec);
    end;
*/

}