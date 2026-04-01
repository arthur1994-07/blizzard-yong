package ItemQuickSlot_fla
{
    import flash.display.*;

    dynamic public class quickSlot_1 extends MovieClip
    {
        public var btnMC:MovieClip;
        public var slotLastItem:MovieClip;
        public var btnLockMC:MovieClip;
        public var slotItem:MovieClip;
        public var titleBtn:s_titleBarButton;

        public function quickSlot_1()
        {
            addFrameScript(0, this.frame1, 9, this.frame10, 10, this.frame11, 19, this.frame20);
            return;
        }// end function

        function frame1()
        {
            this.slotLastItem.visible = false;
            this.slotItem.visible = true;
            return;
        }// end function

        function frame10()
        {
            stop();
            return;
        }// end function

        function frame11()
        {
            this.slotLastItem.visible = true;
            this.slotItem.visible = false;
            return;
        }// end function

        function frame20()
        {
            stop();
            return;
        }// end function

    }
}
