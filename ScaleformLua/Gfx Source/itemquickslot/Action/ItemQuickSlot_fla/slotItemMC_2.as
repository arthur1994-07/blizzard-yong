package ItemQuickSlot_fla
{
    import flash.display.*;
    import flash.text.*;
    import ran.ui.slot.*;

    dynamic public class slotItemMC_2 extends MovieClip
    {
        public var tf1:TextField;
        public var tf2:TextField;
        public var tf3:TextField;
        public var tf4:TextField;
        public var tf5:TextField;
        public var tf6:TextField;
        public var slot0:Slot;
        public var slot1:Slot;
        public var slot2:Slot;
        public var slot3:Slot;
        public var slot4:Slot;
        public var slot5:Slot;
        public var bg:MovieClip;

        public function slotItemMC_2()
        {
            addFrameScript(0, this.frame1);
            return;
        }// end function

        function frame1()
        {
            this.tf1.mouseEnabled = false;
            this.tf2.mouseEnabled = false;
            this.tf3.mouseEnabled = false;
            this.tf4.mouseEnabled = false;
            this.tf5.mouseEnabled = false;
            this.tf6.mouseEnabled = false;
            return;
        }// end function

    }
}
