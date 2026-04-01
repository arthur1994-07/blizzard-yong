package ran.ui.core
{
    import flash.display.*;
    import flash.text.*;

    public class SpeechBubble extends MovieClip
    {
        public const DEFAULT_BOARDWIDTH:uint = 100;
        public const DEFAULT_BOARDHEIGHT:uint = 20;
        public var textField:TextField;
        public var board:MovieClip;

        public function SpeechBubble()
        {
            return;
        }// end function

        public function OpenSpeechBubble(param1:String, param2:Object) : void
        {
            param2.preventAutosizing = true;
            this.textField.width = this.DEFAULT_BOARDWIDTH;
            this.textField.height = this.DEFAULT_BOARDHEIGHT;
            this.textField.text = param1;
            this.textField.width = this.textField.textWidth + 5;
            this.textField.height = this.textField.textHeight + 5;
            this.board.width = this.textField.width + 2;
            this.name = param2.name + "_speechbubble";
            this.x = param2.width / 2;
            param2.addChild(this);
            return;
        }// end function

        public function CloseSpeechBubble() : void
        {
            this.parent.removeChild(this);
            return;
        }// end function

    }
}
