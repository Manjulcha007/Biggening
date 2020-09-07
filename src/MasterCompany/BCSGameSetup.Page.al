page 88007 "BCS Game Setup"
{
    Caption = 'BCS Game Setup';
    PageType = Card;
    SourceTable = "BCS Game Setup";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Game Date"; "Game Date")
                {
                    ApplicationArea = All;
                }
            }

            group(GeneralLedger)
            {
                Caption = 'General Ledger';
                field("Wealth Account"; "Wealth Account")
                {
                    ApplicationArea = All;
                }

                field("Cash Account"; "Cash Account")
                {
                    ApplicationArea = All;
                }
                field("Bot Power Account"; "Bot Power Account")
                {
                    ApplicationArea = All;
                }
                field("Loc. Power Account"; "Loc. Power Account")
                {
                    ApplicationArea = All;
                }

            }

            group(Purchasing)
            {
                field("Purchase Prospect Effort"; "Purchase Prospect Effort")
                {
                    ApplicationArea = All;
                }
                field("Purch. Pros. Tier Multiplier"; "Purch. Pros. Tier Multiplier")
                {
                    ApplicationArea = All;
                    Caption = 'Pros. Tier Multiplier';
                }

                field("Purch. Pros. Base Max Orders"; "Purch. Pros. Base Max Orders")
                {
                    ApplicationArea = All;
                    Caption = 'Pros. Base Max Orders';
                }
                field("Purch. Pros. Base Max Quantity"; "Purch. Pros. Base Max Quantity")
                {
                    ApplicationArea = All;
                    Caption = 'Pros. Base Max Quantity';
                }
            }
            group(Sales)
            {
                field("Sales Prospect Effort"; "Sales Prospect Effort")
                {
                    ApplicationArea = All;
                }
                field("Sales. Pros. Tier Multiplier"; "Sales Pros. Tier Multiplier")
                {
                    ApplicationArea = All;
                    Caption = 'Pros. Tier Multiplier';
                }

                field("Sales. Pros. Base Max Orders"; "Sales Pros. Base Max Orders")
                {
                    ApplicationArea = All;
                    Caption = 'Pros. Base Max Orders';
                }
                field("Sales. Pros. Base Max Quantity"; "Sales Pros. Base Max Quantity")
                {
                    ApplicationArea = All;
                    Caption = 'Pros. Base Max Quantity';
                }

            }
            group(Location)
            {
                Caption = 'Location';
                field("Location No. Series"; "Location No. Series")
                {
                    ApplicationArea = All;
                }
                field("Basic Loc. Max. Bots"; "Basic Loc. Max. Bots")
                {
                    ApplicationArea = All;
                }
                field("Basic Loc. Max. Units"; "Basic Loc. Max. Units")
                {
                    ApplicationArea = All;
                }
                field("Adv. Loc. Max. Bots"; "Adv. Loc. Max. Bots")
                {
                    ApplicationArea = All;
                }
                field("Adv. Loc. Max. Units"; "Adv. Loc. Max. Units")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(TickGameDay)
            {
                Image = CalculateCalendar;
                PromotedIsBig = true;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    Rec.Validate("Game Date", CalcDate('<1D>', Rec."Game Date"));
                    Rec.Modify(true);
                end;
            }
            action(CalcMarket)
            {
                Image = AdjustExchangeRates;
                PromotedIsBig = true;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    MarketCalc: Codeunit "BCS Market Calculation";
                begin
                    MarketCalc.CalculateDailyPrices();
                end;
            }
        }
    }

    trigger OnOpenPage()
    begin
        Reset();
        If not Get() then begin
            Init();
            Insert();
        end;
    end;
}
