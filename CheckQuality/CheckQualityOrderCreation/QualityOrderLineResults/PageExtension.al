/*pageextension 50141 QualityOrderExtension extends "Purchase Order subform"
{ 
    layout
    {
       addafter(Type){
          field("QualityOrder"; Rec.QualityOrder)
            {
                ApplicationArea = All;
            }
       }
       
    }
    
    actions
    {
        addafter("O&rder"){
            action(LineResults){
                ApplicationArea = Suite;
                Caption = 'Quality Order Line Results';
                Promoted = true;
                PromotedIsBig = true;
                Image = Certificate;
                PromotedCategory = Process;
              //  RunObject = page "QualityOrderLineResults";
               // RunPageLink="No" = field("No.");
               
            }
        }
    
    
}
/*
trigger OnInsertRecord(BelowxRec: Boolean): Boolean
var
    PurchaseOrderTable: Record "Purchase Header";
    PurchaseLineTable: Record "Purchase Line";
    ResultLineTable : Record "QualityOrderLineResultsTable";
begin
    BelowxRec := false;

    // Attempt to retrieve the related Purchase Order record
    if PurchaseOrderTable.Get(PurchaseOrderTable."Pay-to Name") then
    begin
        // Attempt to retrieve the related Purchase Line record
        if PurchaseLineTable.Get(PurchaseLineTable.Type = PurchaseLineTable.Type::Item) then
        begin
            // Check if the Results Quantity surpasses the Quantity in the Purchase Line
            if (ResultLineTable.ResultsQuantity > PurchaseLineTable.Quantity) then
            begin
                // Display a message and raise an error if the Quantity is surpassed
                Message('Quantity Surpassed');
                Error('Quantity Surpassed');
            end
            else
            begin
                // Save the record if all validations pass
                SaveRecord();
                BelowxRec := true; // Set BelowxRec to true after saving the record
            end;
        end
        else
        begin
            // Handle cases where the related Purchase Line record cannot be retrieved
            Error('Failed to retrieve related Purchase Line record.');
        end;
    end
    else
    begin
        // Handle cases where the related Purchase Order record cannot be retrieved
        Error('Failed to retrieve related Purchase Order record.');
    end;

    exit(BelowxRec);
end;

  trigger OnInsertRecord(BelowxRec: Boolean): Boolean
   var
    myInt: Integer;
    MyTable: Record "CheckQualityOrderTable";
    MyPurchaseHeader : Record "Purchase Header";
     Ref: RecordRef;
     MyFieldRef: FieldRef;
    MyRecRef: RecordRef;
   begin
    BelowxRec :=false;
    Ref.Open(DATABASE::CheckQualityOrderTable);
    // Open the table records
    MyRecRef.OPEN(50120);
    // Get a reference to the first field of the record
    MyFieldRef := MyRecRef.Field(6);  
     //MyPurchaseHeader.Get(MyPurchaseHeader."No."); 
    Message('Quantity Assigned : %1',MyFieldRef);
    if MyTable.Get(MyTable.Quantity) then begin
        if (MyPurchaseHeader."Total Quantity">MyTable.Quantity) then
        begin
             Message('Quantity Surpassed');
             Error('Quantity Surpassed');
        end;
    end;
    BelowxRec:=true;
    exit(BelowxRec);

    
   end;
   




}*/