# Kele
Kele is a Ruby Gem API client to access the Bloc API.

[Bloc's API Documentation](https://blocapi.docs.apiary.io/#)

## Usage
The client can be used as follows, (Populated with your Bloc.io email and password to access the API.):
```
$ irb
>> require './lib/kele'
=> true
>> Kele.new("jane@gmail.com", "abc123")
```
To retrieve a parsed ruby hash of your Bloc.io account information then run:
```
$ kele_client.get_me
```

To retrieve your mentor's current availability:
```
$ kele_client.get_mentor_availability(mentor_id)
```

To retrieve your Bloc.io roadmap:
```
$ kele_client.get_roadmap(chain_id)
```

To retrieve information on a particular checkpoint:
```
$ kele_client.get_checkpoint(checkpoint_id)
```

To retreive your remaining checkpoints:
```
$ kele_client.get_remaining_checkpoints(chain_id)
```

To retrieve your messages:
```
$ kele_client.get_messages(1) # returns the first page of message threads
$ kele_client.get_messages # returns the first page of messages
```

To send a message:
```
$ kele.client.create_message(sender, recipient_id, token, subject, text)
```
