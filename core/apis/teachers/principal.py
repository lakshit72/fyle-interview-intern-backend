from flask import Blueprint
from core import db
from core.apis import decorators
from core.apis.responses import APIResponse
from core.models.assignments import Assignment
from core.models.teachers import Teacher
from core.apis.teachers.schema import TeacherSchema

from .schema import TeacherSchema
principal_teacher_resources = Blueprint('principal_teacher_resources',__name__)

@principal_teacher_resources.route('/teachers', methods=['GET'],strict_slashes=False)

@decorators.authenticate_principal
def list_teachers(p):
    teacher_list = Teacher.get_teachers_by_principal()
    teacher_list_dump = TeacherSchema().dump(teacher_list,many=True)
    return APIResponse.respond(data=teacher_list_dump)