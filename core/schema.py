from graphene import relay, ObjectType
from graphene.contrib.django.filter import DjangoFilterConnectionField
from graphene.contrib.django.types import DjangoNode

from core.models import Notes

import graphene

import siteprojects.schema


# Graphene will automatically map the User model's fields onto the UserType.
# This is configured in the UserType's Meta class (as you can see below)
class NotesNode(DjangoNode):
    class Meta:
        model = Notes
        filter_fields = ['title',]
        filter_order_by = ['title']


class NotesQuery(ObjectType):
    note = relay.NodeField(NotesNode)
    all_notes = DjangoFilterConnectionField(NotesNode)


class Query(NotesQuery, siteprojects.schema.Query):
    # This class will inherit from multiple Queries
    # as we begin to add more apps to our project
    pass

schema = graphene.Schema(name='Monolit Schema')
schema.query = Query
