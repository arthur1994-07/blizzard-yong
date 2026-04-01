package ran.ui.core
{
    import flash.display.*;
    import flash.text.*;

    public class MSimpleTooltip extends MovieClip
    {
        public const TOOLTIP_DEFAULT_WIDTH:uint = 400;
        public const TOOLTIP_DEFAULT_HEIGHT:uint = 16;
        public var textField:TextField;
        public var mcBG:MovieClip;
        public var component:InteractiveObject;

        public function MSimpleTooltip()
        {
            this.mouseEnabled = false;
            this.mouseChildren = false;
            return;
        }// end function

        public function OpenTooltip(param1:String) : void
        {
            this.textField.width = this.TOOLTIP_DEFAULT_WIDTH;
            this.textField.height = this.TOOLTIP_DEFAULT_HEIGHT;
            this.textField.text = param1;
            this.textField.width = this.textField.textWidth + 5;
            this.textField.height = this.textField.textHeight + 5;
            this.mcBG.width = this.textField.width + 2;
            this.mcBG.height = this.textField.height + 2;
            return;
        }// end function

        public function OpenTooltip_html(param1:String) : void
        {
            this.textField.width = this.TOOLTIP_DEFAULT_WIDTH;
            this.textField.height = this.TOOLTIP_DEFAULT_HEIGHT;
            this.textField.htmlText = param1;
            this.textField.width = this.textField.textWidth + 5;
            this.textField.height = this.textField.textHeight + 5;
            this.mcBG.width = this.textField.width + 2;
            this.mcBG.height = this.textField.height + 2;
            return;
        }// end function

    }
}
