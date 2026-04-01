package ran.ui.core
{
    import flash.display.*;
    import flash.events.*;
    import scaleform.clik.controls.*;

    public class MScrollBar extends MovieClip
    {
        public var track:Button;
        public var thumb:Button;
        public var target:DisplayObject;
        public var scrollSpeed:int = 1;
        protected var origY:int = 0;
        protected var dragY:int = 0;

        public function MScrollBar()
        {
            addEventListener(Event.ENTER_FRAME, this.onEnter, false, 0, true);
            return;
        }// end function

        protected function onEnter(event:Event) : void
        {
            removeEventListener(Event.ENTER_FRAME, this.onEnter);
            this.track.addEventListener(MouseEvent.CLICK, this.onTrackClick, false, 0, true);
            this.track.addEventListener(MouseEvent.MOUSE_WHEEL, this.onTrackWheel, false, 0, true);
            this.thumb.addEventListener(MouseEvent.MOUSE_DOWN, this.onDragStart, false, 0, true);
            this.thumb.addEventListener(MouseEvent.MOUSE_WHEEL, this.onTrackWheel, false, 0, true);
            return;
        }// end function

        public function updateThumb() : void
        {
            if (this.target.height < this.track.height * scaleY)
            {
                this.thumb.visible = false;
            }
            else
            {
                this.thumb.visible = true;
            }
            return;
        }// end function

        public function resetThumb() : void
        {
            this.thumb.y = 0;
            return;
        }// end function

        public function scrollUp() : void
        {
            if (this.target != null)
            {
                if (this.target.height < this.track.height * scaleY)
                {
                    return;
                }
                this.thumb.y = this.thumb.y - this.scrollSpeed / (this.target.height - this.track.height * scaleY);
                if (this.thumb.y < 0)
                {
                    this.thumb.y = 0;
                }
            }
            this.updateScroll();
            return;
        }// end function

        public function scrollDown() : void
        {
            if (this.target != null)
            {
                if (this.target.height < this.track.height * scaleY)
                {
                    return;
                }
                this.thumb.y = this.thumb.y + this.scrollSpeed / (this.target.height - this.track.height * scaleY);
                if (this.thumb.y + this.thumb.height > this.track.height)
                {
                    this.thumb.y = this.track.height - this.thumb.height;
                }
            }
            this.updateScroll();
            return;
        }// end function

        public function updateScroll() : void
        {
            if (this.target == null)
            {
                return;
            }
            if (this.target.height < this.track.height * scaleY)
            {
                return;
            }
            var _loc_1:* = this.thumb.y / (this.track.height - this.thumb.height);
            this.target.y = (this.target.height - this.track.height * scaleY) * _loc_1 * -1;
            return;
        }// end function

        public function syncScroll() : void
        {
            if (this.target == null)
            {
                return;
            }
            var _loc_1:* = Math.abs(this.target.y) / (this.target.height - this.track.height * scaleY);
            this.thumb.y = (this.track.height - this.thumb.height) * _loc_1;
            return;
        }// end function

        protected function onTrackClick(event:MouseEvent) : void
        {
            if (event.localY < this.thumb.y)
            {
                this.scrollUp();
            }
            else
            {
                this.scrollDown();
            }
            return;
        }// end function

        public function onTrackWheel(event:MouseEvent) : void
        {
            if (event.delta > 0)
            {
                this.scrollUp();
            }
            else
            {
                this.scrollDown();
            }
            return;
        }// end function

        protected function onDragStart(event:MouseEvent) : void
        {
            stage.addEventListener(MouseEvent.MOUSE_MOVE, this.onDragging, false, 0, true);
            stage.addEventListener(MouseEvent.MOUSE_UP, this.onDragEnd, false, 0, true);
            this.origY = this.thumb.y;
            this.dragY = event.stageY;
            return;
        }// end function

        protected function onDragging(event:MouseEvent) : void
        {
            if (this.target != null)
            {
                if (this.target.height < this.track.height * scaleY)
                {
                    return;
                }
            }
            var _loc_2:* = this.origY + (event.stageY - this.dragY) / scaleY;
            if (_loc_2 < 0)
            {
                _loc_2 = 0;
            }
            else if (_loc_2 + this.thumb.height > this.track.height)
            {
                _loc_2 = this.track.height - this.thumb.height;
            }
            this.thumb.y = _loc_2;
            this.updateScroll();
            return;
        }// end function

        protected function onDragEnd(event:MouseEvent) : void
        {
            stage.removeEventListener(MouseEvent.MOUSE_MOVE, this.onDragging);
            stage.removeEventListener(MouseEvent.MOUSE_UP, this.onDragEnd);
            return;
        }// end function

    }
}
