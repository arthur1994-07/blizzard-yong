package GuideSummonHeadChat_fla
{
    import flash.display.*;
    import scaleform.gfx.*;

    dynamic public class MainTimeline extends MovieClip
    {
        public var headChat:MovieClip;

        public function MainTimeline()
        {
            addFrameScript(0, this.frame1);
            return;
        }// end function

        public function SetText(param1:String) : void
        {
            this.headChat.textField.visible = true;
            this.headChat.bg.visible = true;
            this.headChat.textField.htmlText = param1;
            this.headChat.textField.height = this.headChat.textField.textHeight + 4;
            this.headChat.bg.height = this.headChat.textField.height + 10;
            return;
        }// end function

        public function SetPosition(param1:String, param2:String) : void
        {
            this.headChat.x = Number(param1);
            this.headChat.y = Number(param2);
            return;
        }// end function

        public function Hide() : void
        {
            this.headChat.textField.visible = false;
            this.headChat.bg.visible = false;
            return;
        }// end function

        function frame1()
        {
            InteractiveObjectEx.setHitTestDisable(this, true);
            this.headChat.textField.wordWrap = true;
            this.Hide();
            return;
        }// end function

    }
}
