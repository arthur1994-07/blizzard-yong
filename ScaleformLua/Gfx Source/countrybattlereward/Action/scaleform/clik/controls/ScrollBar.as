package scaleform.clik.controls
{
    import flash.events.*;
    import flash.geom.*;
    import flash.text.*;
    import scaleform.clik.constants.*;
    import scaleform.clik.core.*;
    import scaleform.clik.events.*;
    import scaleform.clik.utils.*;

    public class ScrollBar extends ScrollIndicator
    {
        public var trackScrollPageSize:Number = 1;
        protected var _dragOffset:Point;
        protected var _trackMode:String = "scrollPage";
        protected var _trackScrollPosition:Number = -1;
        protected var _trackDragMouseIndex:Number = -1;
        public var upArrow:Button;
        public var downArrow:Button;

        public function ScrollBar()
        {
            return;
        }// end function

        override protected function initialize() : void
        {
            super.initialize();
            var _loc_1:* = rotation;
            rotation = 0;
            if (this.downArrow)
            {
                constraints.addElement("downArrow", this.downArrow, Constraints.BOTTOM);
            }
            constraints.addElement("track", track, Constraints.TOP | Constraints.BOTTOM);
            rotation = _loc_1;
            return;
        }// end function

        override protected function preInitialize() : void
        {
            constraints = new Constraints(this, ConstrainMode.REFLOW);
            return;
        }// end function

        override public function get enabled() : Boolean
        {
            return super.enabled;
        }// end function

        override public function set enabled(param1:Boolean) : void
        {
            if (this.enabled == param1)
            {
                return;
            }
            super.enabled = param1;
            gotoAndPlay(this.enabled ? ("default") : ("disabled"));
            invalidate(InvalidationType.STATE);
            return;
        }// end function

        override public function get position() : Number
        {
            return _position;
        }// end function

        override public function set position(param1:Number) : void
        {
            param1 = Math.round(param1);
            if (param1 == this.position)
            {
                return;
            }
            super.position = param1;
            this.updateScrollTarget();
            return;
        }// end function

        public function get trackMode() : String
        {
            return this._trackMode;
        }// end function

        public function set trackMode(param1:String) : void
        {
            if (param1 == this._trackMode)
            {
                return;
            }
            this._trackMode = param1;
            if (initialized)
            {
                track.autoRepeat = this.trackMode == ScrollBarTrackMode.SCROLL_PAGE;
            }
            return;
        }// end function

        override public function get availableHeight() : Number
        {
            return track.height - thumb.height + offsetBottom + offsetTop;
        }// end function

        override public function toString() : String
        {
            return "[CLIK ScrollBar " + name + "]";
        }// end function

        override protected function configUI() : void
        {
            super.configUI();
            var _loc_1:* = this.enabled;
            mouseChildren = this.enabled;
            mouseEnabled = _loc_1;
            var _loc_1:* = _focusable;
            tabChildren = _focusable;
            tabEnabled = _loc_1;
            addEventListener(MouseEvent.MOUSE_WHEEL, this.handleMouseWheel, false, 0, true);
            addEventListener(InputEvent.INPUT, handleInput, false, 0, true);
            if (this.upArrow)
            {
                this.upArrow.addEventListener(ButtonEvent.CLICK, this.handleUpArrowClick, false, 0, true);
                this.upArrow.addEventListener(ButtonEvent.PRESS, this.handleUpArrowPress, false, 0, true);
                this.upArrow.focusTarget = this;
                this.upArrow.autoRepeat = true;
            }
            if (this.downArrow)
            {
                this.downArrow.addEventListener(ButtonEvent.CLICK, this.handleDownArrowClick, false, 0, true);
                this.downArrow.addEventListener(ButtonEvent.PRESS, this.handleDownArrowPress, false, 0, true);
                this.downArrow.focusTarget = this;
                this.downArrow.autoRepeat = true;
            }
            thumb.addEventListener(MouseEvent.MOUSE_DOWN, this.handleThumbPress, false, 0, true);
            thumb.focusTarget = this;
            thumb.lockDragStateChange = true;
            track.addEventListener(MouseEvent.MOUSE_DOWN, this.handleTrackPress, false, 0, true);
            track.addEventListener(ButtonEvent.CLICK, this.handleTrackClick, false, 0, true);
            if (track is UIComponent)
            {
                (track as UIComponent).focusTarget = this;
            }
            track.autoRepeat = this.trackMode == ScrollBarTrackMode.SCROLL_PAGE;
            return;
        }// end function

        protected function scrollUp() : void
        {
            this.position = this.position - _pageScrollSize;
            if (scrollTarget != null)
            {
                scrollTarget.dispatchEvent(new ScrollEvent(ScrollEvent.SCROLL_EVENT, false, true, _pageScrollSize));
            }
            return;
        }// end function

        protected function scrollDown() : void
        {
            this.position = this.position + _pageScrollSize;
            if (scrollTarget != null)
            {
                scrollTarget.dispatchEvent(new ScrollEvent(ScrollEvent.SCROLL_EVENT, false, true, _pageScrollSize));
            }
            return;
        }// end function

        override protected function drawLayout() : void
        {
            var _loc_1:* = NaN;
            thumb.y = track.y - offsetTop;
            if (isHorizontal)
            {
                constraints.update(_height, _width);
            }
            else
            {
                constraints.update(_width, _height);
            }
            if (isHorizontal && actualWidth != width)
            {
                _loc_1 = width / actualWidth;
                scaleY = _loc_1;
            }
            return;
        }// end function

        override protected function updateThumb() : void
        {
            var _loc_1:* = Math.max(1, _maxPosition - _minPosition + _pageSize);
            var _loc_2:* = track.height + offsetTop + offsetBottom;
            thumb.height = Math.max(_minThumbSize, Math.min(_loc_2, _pageSize / _loc_1 * _loc_2));
            if (thumb is UIComponent)
            {
                (thumb as UIComponent).validateNow();
            }
            this.updateThumbPosition();
            return;
        }// end function

        override protected function updateThumbPosition() : void
        {
            var _loc_1:* = (_position - _minPosition) / (_maxPosition - _minPosition);
            var _loc_2:* = track.y - offsetTop;
            var _loc_3:* = Math.round(_loc_1 * this.availableHeight + _loc_2);
            thumb.y = Math.max(_loc_2, Math.min(track.y + track.height - thumb.height + offsetBottom, _loc_3));
            thumb.visible = !(isNaN(_loc_1) || isNaN(_pageSize) || _maxPosition <= 0 || _maxPosition == Infinity);
            var _loc_4:* = thumb.visible && this.enabled;
            if (this.upArrow)
            {
                this.upArrow.enabled = _loc_4 && _position > _minPosition;
                this.upArrow.validateNow();
            }
            if (this.downArrow)
            {
                this.downArrow.enabled = _loc_4 && _position < _maxPosition;
                this.downArrow.validateNow();
            }
            var _loc_5:* = _loc_4;
            track.mouseEnabled = _loc_4;
            track.enabled = _loc_5;
            return;
        }// end function

        protected function handleUpArrowClick(event:ButtonEvent) : void
        {
            if (event.isRepeat)
            {
                this.scrollUp();
            }
            return;
        }// end function

        protected function handleUpArrowPress(event:ButtonEvent) : void
        {
            this.scrollUp();
            return;
        }// end function

        protected function handleDownArrowClick(event:ButtonEvent) : void
        {
            if (event.isRepeat)
            {
                this.scrollDown();
            }
            return;
        }// end function

        protected function handleDownArrowPress(event:ButtonEvent) : void
        {
            this.scrollDown();
            return;
        }// end function

        protected function handleThumbPress(event:Event) : void
        {
            if (_isDragging)
            {
                return;
            }
            _isDragging = true;
            stage.addEventListener(MouseEvent.MOUSE_MOVE, this.doDrag, false, 0, true);
            stage.addEventListener(MouseEvent.MOUSE_UP, this.endDrag, false, 0, true);
            this._dragOffset = new Point(0, mouseY - thumb.y);
            return;
        }// end function

        protected function doDrag(event:MouseEvent) : void
        {
            var _loc_2:* = (mouseY - this._dragOffset.y - track.y) / this.availableHeight;
            var _loc_3:* = this.position;
            this.position = _minPosition + _loc_2 * (_maxPosition - _minPosition);
            _loc_3 = this.position - _loc_3;
            if (scrollTarget != null)
            {
                scrollTarget.dispatchEvent(new ScrollEvent(ScrollEvent.SCROLL_EVENT, false, true, _loc_3));
            }
            return;
        }// end function

        protected function endDrag(event:MouseEvent) : void
        {
            stage.removeEventListener(MouseEvent.MOUSE_MOVE, this.doDrag);
            stage.removeEventListener(MouseEvent.MOUSE_UP, this.endDrag);
            _isDragging = false;
            return;
        }// end function

        protected function handleTrackPress(event:MouseEvent) : void
        {
            var _loc_3:* = NaN;
            if (event.shiftKey || this.trackMode == ScrollBarTrackMode.SCROLL_TO_CURSOR)
            {
                _loc_3 = (mouseY - thumb.height / 2 - track.y) / this.availableHeight;
                this.position = Math.round(_loc_3 * (_maxPosition - _minPosition) + _minPosition);
                thumb.dispatchEventAndSound(new MouseEvent(MouseEvent.MOUSE_OVER));
                thumb.dispatchEventAndSound(new MouseEvent(MouseEvent.MOUSE_DOWN));
                this.handleThumbPress(event);
                this._dragOffset = new Point(0, thumb.height / 2);
            }
            if (_isDragging || this.position == this._trackScrollPosition)
            {
                return;
            }
            if (mouseY > thumb.y && mouseY < thumb.y + thumb.height)
            {
                return;
            }
            var _loc_2:* = thumb.y < mouseY ? (this.trackScrollPageSize) : (-this.trackScrollPageSize);
            this.position = this.position + _loc_2;
            if (scrollTarget != null)
            {
                scrollTarget.dispatchEvent(new ScrollEvent(ScrollEvent.SCROLL_EVENT, false, true, _loc_2));
            }
            return;
        }// end function

        protected function handleTrackClick(event:ButtonEvent) : void
        {
            var _loc_2:* = 0;
            if (event.isRepeat)
            {
                if (_isDragging || this.position == this._trackScrollPosition)
                {
                    return;
                }
                if (mouseY > thumb.y && mouseY < thumb.y + thumb.height)
                {
                    return;
                }
                _loc_2 = thumb.y < mouseY ? (this.trackScrollPageSize) : (-this.trackScrollPageSize);
                this.position = this.position + _loc_2;
            }
            if (scrollTarget != null)
            {
                scrollTarget.dispatchEvent(new ScrollEvent(ScrollEvent.SCROLL_EVENT, false, true, _loc_2));
            }
            return;
        }// end function

        protected function updateScrollTarget() : void
        {
            if (_scrollTarget == null || !this.enabled)
            {
                return;
            }
            var _loc_1:* = _scrollTarget as TextField;
            if (_loc_1 != null)
            {
                _scrollTarget.scrollV = _position;
            }
            return;
        }// end function

        protected function handleMouseWheel(event:MouseEvent) : void
        {
            this.position = this.position - (event.delta > 0 ? (1) : (-1)) * _pageScrollSize;
            if (scrollTarget == null)
            {
                dispatchEvent(new ScrollEvent(ScrollEvent.SCROLL_EVENT, false, true, event.delta));
            }
            else if (scrollTarget != null && scrollTarget is ScrollingList == false)
            {
                scrollTarget.dispatchEvent(new ScrollEvent(ScrollEvent.SCROLL_EVENT, false, true, event.delta));
            }
            return;
        }// end function

        override protected function changeFocus() : void
        {
            thumb.displayFocus = _focused || _displayFocus;
            return;
        }// end function

    }
}
