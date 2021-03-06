To Do List
Neil's Models and relationships:

USER
    has_many :created_invitations (:event)
    has_many :hosted_invitations (:event)
    has_many :guest_invitations (:event)
    has_many :rsvps
    has_many :attended_events (:event_attendance)
  fields >> [:first_name, :last_name, :email, :password_stuff]

EVENT
    belongs_to :creator (:user)
    has_many :hosts (:user)
    has_many :invited_guests (:user)
    has_many :rsvps
    belongs_to :location
  fields >> [:start_date, :end_date, :start_time, :end_time, :location_id ]

RSVP
    belongs_to :user
    belongs_to :event
  :yes/no/maybe

LOCATION
    has_many :events  
  fields >> [:city, :state, :zip, :address, :lat, :lng]

EVENT_ATTENDANCE   1. who needs to be related to this?  2. How many of each thing can each side have?
    belongs_to :user
    belong_to :event

:id     :user_id    :event_id
  1          1           1
  2          1           3
  3          1           4
...


-----------------------
Join tables

INVITATIONHOSTING  << "join table"
    belongs_to :host (:user)
    belongs_to :hosted_invitation (:invitation) 
invitation_id           user_id
1                           1
1                           2
1                           5    
2                           1
2                           5

GUESTINVITING
    belongs_to :invited_guest (:user)
    belongs_to :invitation

    