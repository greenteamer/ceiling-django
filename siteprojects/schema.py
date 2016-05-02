from graphene import relay, ObjectType
from graphene.contrib.django.filter import DjangoFilterConnectionField
from graphene.contrib.django.types import DjangoNode

from siteprojects.models import Project, Category, ProjectImage

import graphene


# Graphene will automatically map the User model's fields onto the UserType.
# This is configured in the UserType's Meta class (as you can see below)
class CategoryNode(DjangoNode):
    class Meta:
        model = Category

class ProjectsNode(DjangoNode):
    class Meta:
        model = Project


class Query(ObjectType):
    category = relay.NodeField(CategoryNode)
    all_categories = DjangoFilterConnectionField(CategoryNode)

    project = relay.NodeField(ProjectsNode)
    all_projects = DjangoFilterConnectionField(ProjectsNode)

    class Meta:
        abstract = True
